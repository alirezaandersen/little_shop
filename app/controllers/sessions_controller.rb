class SessionsController < ApplicationController

  def new
    if URI(request.referer).path == "/favorites"
      session[:referrer] = "/favorites"
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:favorite] ||= {}
      user_session = JSON.parse(user.session) || {"favorite" => {}, "visit" => {}}
      user_session["favorite"] ||= {}
      user_session["visit"] ||= {}
      session[:favorite] = user_session["favorite"].merge(session[:favorite])
      session[:visit] = user_session["visit"] || {}
      session[:user_id] = user.id
      flash[:alert] = "Welcome #{user.first_name}"
      if session[:referrer] == "/favorites"
        session.delete(:referrer)
        redirect_to "/favorites"
      elsif current_user && current_admin?
        redirect_to '/admin/dashboard'
      else
        redirect_to '/dashboard'
      end
    else
      flash[:alert] = "Invalid Email or Password"
      render :new
    end
  end

  def destroy
    current_user.update(session: ({favorite: session[:favorite], visit: session[:visit]}).to_json)
    session.clear
    redirect_to root_path
  end
end
