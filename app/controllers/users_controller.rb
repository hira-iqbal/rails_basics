class UsersController < ApplicationController

  def index
    @users = User.all
  end
  def edit
    @user = User.find_by(params[:id])
  end
  def update
    @user = User.find_by(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: "User role is successfully updated!"
     else
      redirect_to edit_user_path, alert: @user.errors.full_messages
    end
  end
  def user_params
    params.require(:user).permit({role_ids:[]})
  end
end

