class Items::SearchesController < ApplicationController
  def index
    @items = Item.search(params[:keyword])

    @item_array = []
    Item.where(switch: 2, sold: 1, user_id: current_user.id).each do |num|
      @item_array << num
    end
    @num = @item_array.length
  end
end
