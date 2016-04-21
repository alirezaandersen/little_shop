class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:alert] = "Welcome #{user.first_name}"
      redirect_to root_path
    else
      flash[:alert] = "Invalid Email or Password"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
