class FavoritesController < ApplicationController

  before_action :set_item, only: [:create, :destroy]

  def index
    @item = Item.all
    @favorite = Favorite.where(user_id: current_user.id)
    # @items = @item.favorites.where(user_id: current_user.id)
    # @item = Item.where.not(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: @item.id)
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id: @item.id)
    @favorite.destroy
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
