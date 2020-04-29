class UsersController < ApplicationController

  before_action :move_to_index, except: [:new]


  def index
    @user = User.find(params[:id])
  end

  def new

    if user_signed_in?
      redirect_to root_path
    else
      @user = User.new
      @user.build_profile
    end

  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path(@user)
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_path unless user_path(params[:id]) == user_path(current_user.id)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end


end
