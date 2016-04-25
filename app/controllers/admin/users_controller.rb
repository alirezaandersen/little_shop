class Admin::UsersController < Admin::BaseController
  before_action :user_modifies_self, only: [:edit, :update]

  def update
    if @user.update(user_params)
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def user_modifies_self
    if current_user == User.find(params[:id])
      @user = current_user
    else
      render file: "/public/404"
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
