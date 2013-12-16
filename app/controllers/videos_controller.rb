class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  
  # GET /videos
  # GET /videos r.call_status.1.json
  def index
    @videos = Video.find :all

    respond_to do |format|
      format.html { @videos }
      format.json { render json: @videos }
    end
    
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    respond_to do |format|
      format.html { @video }
      format.json { render json: @video.user }
    end

  end

  # GET /videos/new
  def new
    @video = Video.new
    respond_to do |format|
      format.html { @video = Video.new }
      format.json { render json: Video.new }
    end
  end

  # GET /videos/1/edit
  def edit
    @users = User.select('distinct name').collect { |p| p.name }
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params) 
    @video.user = User.find(session[:user_id])
    respond_to do |format|
      if @video.save
        format.html { redirect_to edit_video_path(@video), notice: "Video was successfully uploaded" }
      else
        format.html { render action: 'new' }
      end
    end
  end 


  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format| 
      if @video.update(video_params)
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
    @video.destroy!
    respond_to do |format|
      format.html { redirect_to videos_path }
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
      params.require(:video).permit(:video_key, :file, :title, :description, :author, :tags, :local, :remote, :host, :user)
    end
end
