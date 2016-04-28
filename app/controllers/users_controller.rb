class UsersController < ApplicationController

  def new
    @user = User.new
    if URI(request.referer).path == "/favorites"
      session[:referrer] = "/favorites"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # UserMailer.new_user_email(@user).deliver_now
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.first_name}"
      if session[:referrer] == "/favorites"
        session.delete(:referrer)
        redirect_to "/favorites"
      else
        redirect_to "/dashboard"
      end
    else
      flash.now[:error] = "Failed to create account."
      render :new
    end
  end

  def show
    if current_user
      @user = current_user
    else
      redirect_to root_path
    end
  end

private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :phone_number
    )
  end

end
