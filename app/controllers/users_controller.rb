class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

end
