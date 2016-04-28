module SessionsHelper
  def set_favorite
    @favorite = Favorite.new(session[:favorite])
  end

  def set_visit
    @visitation = Visitation.new(session[:visit])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def setup_session(user)
    session[:favorite] ||= {}
    user_session =
      JSON.parse(user.session) || { "favorite" => {}, "visit" => {} }
    user_session["favorite"] ||= {}
    user_session["visit"] ||= {}
    session[:favorite] = user_session["favorite"].merge(session[:favorite])
    session[:visit] = user_session["visit"] || {}
    session[:user_id] = user.id
  end

  def login_redirect(referrer)
    if referrer == "/favorites"
      "/favorites"
    elsif current_admin?
      "/admin/dashboard"
    else
      "/dashboard"
    end
  end
end
