class UsersController < ApplicationController

  before_action :move_to_index, except: [:new]
  before_action :set_user, only: [:index, :show, :edit, :update]


  def index
  end

  def new

    if user_signed_in?
      redirect_to root_path
    else
      @user = User.new
      @user.build_profile
    end
  end

  def show
    redirect_to root_path unless user_path(params[:id]) == user_path(current_user.id)
    @item = Item.all
    
    @item_array = []
    Item.where(switch: 2, sold: 1, user_id: current_user.id).each do |num|
      @item_array << num
    end
    @num = @item_array.length
  end

  def edit
  end

  def update
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to user_path(current_user.id)
    else
      redirect_to edit_user_path(current_user.id), flash: { alert: "編集に失敗しました"}
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_path
  end

  def likes
    @item_array = []
    Item.where(switch: 2, sold: 1, user_id: current_user.id).each do |num|
      @item_array << num
    end
    @num = @item_array.length
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
