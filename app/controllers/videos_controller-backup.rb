class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    key = @video.video_key

    @call = BitsOnTheRun::API.new(:call)
    @call.method('videos/show', :video_key => key)
    r = @call.execute
    if r.status == "ok"
      @video.title = r.video.title
      @video.description = r.video.description
    end
    @embed_src = "http://content.bitsontherun.com/players/2KjJbeMo-#{key}.js" 
    


    #r = BitsOnTheRun::call('videos/show', :video_key => key)

    #@video.title = r.media.title
    #@video.description = r.media.description

  end

  # GET /videos/new
  def new
    respond_to do |format|
      format.html { @video = Video.new }
      format.json { render json: @botr }
    end
  end

  # GET /videos/1/edit
  def edit

    key = @video.video_key

    @call = BitsOnTheRun::API.new(:call)
    @call.method('videos/show', :video_key => key)
    r = @call.execute
    if r.status == "ok"
      @video.title = r.video.title
      @video.description = r.video.description
    end
    @embed_src = "http://content.bitsontherun.com/players/2KjJbeMo-#{key}.js" 

  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    video_file = params[:video][:file]

    @call = BitsOnTheRun::API.new(:store)
    @call.method('videos/create')
    @call.file(video_file.path)
    r = @call.execute

    if r.status == "ok"
      @video.video_key = r.media.key
      respond_to do |format|
        if @video.save
          format.html { redirect_to edit_video_path(@video), notice: 'Video was successfully uploaded' }
        else
          format.html { render action: 'new' }
        end
      end
    end
    


    #if response[:status] == "ok"
    #  save_status = @video.save
    #  respond_to do |format|
    #    if save_status
    #      format.html { redirect_to @video, notice: 'Video was successfully created.' }
    #      format.json { render action: 'show', status: :created, location: @video }
    #    else
    #      format.html { render action: 'new' }
    #      format.json { render json: @video.errors, status: :unprocessable_entity }
    #    end
    #  end
    #end


  end


  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update

    @call = BitsOnTheRun::API.new(:call)
    @call.method('videos/update', :video_key => video_params[:video_key], :title => video_params[:title], :description => video_params[:description])

    respond_to do |format|
      if @call.execute.ok?
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:video_key, :file, :title, :description)
    end
end
