class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  before_action :set_video_defaults

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "You must be logged in to do that"
    end
  end

  def admin_auth
    unless User.find_by(id: session[:user_id]).access_level != 'Trainer'
      redirect_to app_url, notice: "You're not allowed to access this area"
    end
  end

  private

  def set_video_defaults
    @all_videos = all_videos
    #@my_videos = User.find(session[:user_id]).videos if session[:user_id]
    @new_video = Video.new
  end

  def all_videos
    Video.all 
    #Video.botr_find_all
  end

end
