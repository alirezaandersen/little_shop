class SessionsController < ApplicationController

  def new
    if request.referer && URI(request.referer).path == "/favorites"
      session[:referrer] = "/favorites"
    end
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      setup_session(user)
      flash[:alert] = "Welcome #{user.first_name}"
      new_path = login_redirect(session[:referrer])
      redirect_to new_path
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
