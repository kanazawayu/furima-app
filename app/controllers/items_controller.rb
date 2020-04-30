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
      redirect_to root_path
    else
      flash.now[:alert] = "必須項目を入力して下さい"
      render action: :new
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
                  :sold,
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
          .merge(user_id: current_user.id)
  end
end
