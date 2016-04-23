class Admin::UsersController < Admin::BaseController

  def update
    @user = User.update(user_params)
  end

  def edit
    @user = User.find(params[:id])
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
