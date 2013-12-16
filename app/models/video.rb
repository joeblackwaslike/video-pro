class Video < ActiveRecord::Base
  belongs_to :user

  # CONSTANTS
  API_MIRRORING = false
  THUMBNAIL_SIZES = [40, 120, 320, 480, 720]
  URL_PREFIX="http://"
  CDN_DOMAIN="content.bitsontherun.com"
  THUMBS_DIR="/thumbs/"
  PLAYERS_DIR="/players/"
  PREVIEWS_DIR="/previews/"
  DEFAULT_PLAYER_KEY="rYgry0mG"
  HTML_SUFFIX=".html"
  THUMBS_SUFFIX=".jpg"
  DEFAULT_THUMB_SIZE="120"

  attr_accessor :file, :embed_src, :thumb_src, :preview_src

  # CALLBACKS
  before_create :before_create
  after_update :after_update
  after_destroy :after_destroy

  def attribute_keys
    self.attributes.keys - ["id", "created_at", "updated_at", "user_id", "deleted"]
  end

  def to_yml
    keys = attribute_keys
    output = ""

    output += "---\n"
    for key in keys
      value = @attributes[key].to_s
      output += "  #{key}: #{value}\n"
    end
    return output
  end
 
  def self.get_thumb_url(key, size=120)
    URL_PREFIX+CDN_DOMAIN+THUMBS_DIR+key+'-'+size.to_s+THUMBS_SUFFIX
  end
  def embed_src
    URL_PREFIX+CDN_DOMAIN+PLAYERS_DIR+self.video_key+'-'+DEFAULT_PLAYER_KEY+HTML_SUFFIX
  end
  def thumb_src
    URL_PREFIX+CDN_DOMAIN+THUMBS_DIR+self.video_key+'-'+DEFAULT_THUMB_SIZE+THUMBS_SUFFIX
  end
  def preview_src
    URL_PREFIX+CDN_DOMAIN+PREVIEWS_DIR+self.video_key+'-'+DEFAULT_PLAYER_KEY
  end

private

  def self.clear_table!
    ActiveRecord::Base.connection.execute("DELETE from videos WHERE 0=0")
  end

  def self.api_import
    @call = BitsOnTheRun::API.new(:call)
    @call.method('videos/list', :order_by => 'date:desc', :result_limit => 1000)
    r = @call.execute
    if r.ok?   
      videos = r.videos
      for video in videos

        video.title.gsub!(/:|"/, ' ') unless video.title.nil?
        video.description.gsub!(/:|"/, ' ') unless video.description.nil?
        video.tags.gsub!(/:|"/, ' ') unless video.tags.nil?

        Video.find_or_create_by_video_key( 
          video_key: video.key, 
          user_id: 4,
          title: video.title,
          description: video.description,
          author: video.author,
          duration: video.duration.to_i,
          tags: video.tags,
          local: false,
          remote: true,
          host: 'botr'
        )
        Video.count
      end
    else
      raise 'Error accessing the API during Import'
    end
  end

  def from_api
    @call = BitsOnTheRun::API.new(:call)
    @call.method('videos/show', :video_key => self.video_key)
    r = @call.execute
    if r.ok?
      video = r.video
      v_api = Video.new(
        video_key: video.key,
        title: video.title,
        description: video.description,
        author: video.author,
        duration: video.duration,
        tags: video.tags
      )
    else
      raise 'Error fetching matching object from API'
    end
  end
  def before_create
    prepare_api_for_upload if API_MIRRORING
  end
  def after_update
    update_api if API_MIRRORING
  end
  def after_destroy
    delete_in_api if API_MIRRORING
  end

  def prepare_api_for_upload
    unless self.file.nil?
      call = BitsOnTheRun::API.new(:store)
      call.method('videos/create', author: self.user.name)
      call.file(self.file.path)
      r = call.execute
      if r.ok?
        self.video_key = r.media.key
      else
        raise 'Error receiving upload in API'
      end
    end
  end

  def update_api
    users = User.select('distinct name').collect { |p| p.name }
    if self.author && users.include?(self.author)
      call = BitsOnTheRun::API.new(:call)
      call.method('videos/update', video_key: self.video_key, author: self.author)
      r = call.execute
      raise 'Error updating object author in API' if !r.ok?
    end
    call = BitsOnTheRun::API.new(:call)
    call.method('videos/update', video_key: self.video_key, title: self.title, description: self.description, tags: self.tags)
    r = call.execute
    raise 'Error updating object in API' if !r.ok?
  end

  def delete_in_api
    call = BitsOnTheRun::API.new(:call)
    call.method('videos/delete', video_key: self.video_key)
    r = call.execute
    raise 'Error deleting object in API' if !r.ok?
  end

end