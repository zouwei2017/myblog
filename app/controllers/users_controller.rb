class UsersController < ApplicationController
  def index
    @users = User.all.order(:username)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @user = User.find_by(params[:user_id])
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def update
    @user = User.find_by(params[:user_id])
    @user.update(user_params)
  end

  def destroy
    @user = User.find_by(params[:user_id])
    @user.destroy
  end

  private

  def user_params
    params.require(:user_id).permit(:user_name, :email, :password, :is_admin)
  end
end
