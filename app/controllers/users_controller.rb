class UsersController < ApplicationController

  before_action :find_user,only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "User role is successfully updated!"
     else
      redirect_to edit_user_path, alert: @user.errors.full_messages
    end
  end

  def user_params
    params.require(:user).permit({role_ids:[]})
  end

  def find_user
    @user = User.find_by(params[:id])
  end
end

