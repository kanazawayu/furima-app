class AddressesController < ApplicationController

  before_action :check_user

  def index
    @address = User.find(current_user.id).address
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to user_path(current_user.id)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(current_user.address.id)
    address.update(address_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    Address.find(current_user.address.id).destroy
    redirect_to user_path(current_user.id)
  end

  def check_user
    if user_signed_in?
      redirect_to user_path(current_user.id) unless User.find(params[:user_id]) == current_user
    else
      redirect_to root_path
    end
  end

  private
  def address_params
    params.require(:address).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :address_number, :prefecture_id, :city, :street_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
