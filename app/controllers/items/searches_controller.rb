class Items::SearchesController < ApplicationController
  def index
    @items = Item.searchs(params[:keyword])
    @num = @items.where(switch: "published", sold: "sale")
    @keyword = params[:keyword]
  end
end
