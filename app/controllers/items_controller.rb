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
    @item = Item.new(item_params)
    if @item.save
      # params[:images][:image].each do |image|
      #   @item.images.create(image: image, item_id: @item.id)
      # end
      redirect_to root_path
    else
      render :new
    end
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
