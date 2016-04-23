class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:favorite] ||= {}
      user_session = JSON.parse(user.session) || {"favorite" => {}, "visit" => {}}
      session[:favorite] = user_session["favorite"].merge(session[:favorite])
      session[:visit] = user_session["visit"] || {}
      session[:user_id] = user.id
      flash[:alert] = "Welcome #{user.first_name}"
      redirect_to '/dashboard'
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
