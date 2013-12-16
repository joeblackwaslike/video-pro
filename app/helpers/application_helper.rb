module ApplicationHelper

  def logged_in?
    User.find_by(id: session[:user_id])
  end

  def can_admin_users?
    u = logged_in?
    u.access_level != 'Trainer'
  end

  def is_own_video?(video)
    u = logged_in?
    true if video.user && video.user.id == u.id
  end

  def user_name
    if logged_in?
      User.find_by(id: session[:user_id]).name
    end
  end

  def nav_item(name, path)
    if current_page?(path)
      @title = name
    end
    content_tag(:li, class: (current_page?(path) ? 'active' : nil) ){link_to(name, path)}
  end

  def markdown(key)
    f = Fragment.find_by_key key

    f.render.html_safe
  end

end
