class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.build
    @item.build_brand
    @item.build_shipment
  end

  def create
    Item.create(item_params)
  end

  def show
  end

  private
  def item_params
    params.require(:item)
          .permit(:name,
                  :info,
                  :status,
                  :category_id,
                  :switch,
                  :value,
                  images_attributes:[
                    :image
                  ],
                  brand_attributes:[
                    :name
                  ],
                  shipment_attributes:[
                    :delivery_burden,
                    :prefecture_id,
                    :days
                  ])
          .merge(user_id: 1)
  end
end
