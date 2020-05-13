class Items::SearchesController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = Item.searchs(params[:keyword])
    @num = @items.where(switch: "published", sold: "sale").includes(:favorites)
    @keyword = params[:keyword]
    @category = Category.where(ancestry: nil)
  end
end
