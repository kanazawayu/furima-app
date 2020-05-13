class ItemsController < ApplicationController
  require 'payjp'
  before_action :move_to_index, except: [:index]
  before_action :check_user, only: [:edit, :update]
  before_action :set_item, only: [:show, :destroy, :edit, :update]

  def index
    @q = Item.ransack(params[:q])
    @item = @q.result(distinct: true).includes(:favorites)

    # @item = Item.all
    # @category_parent_array = []
    # Category.where(ancestry: nil).each do |parent|
    #   @category_parent_array << parent.name
    # end
  end

  def new
    @item = Item.new
    @item.images.build
    @item.build_brand
    @item.build_shipment

    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path, flash: { alert: "必須項目を入力して下さい"}
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    return redirect_to user_path(current_user.id) if @item.user_id != current_user.id
    grandchild_category = @item.category
    child_category = grandchild_category.parent

    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    
    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end
    
    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
    
  end

  def update
    if @item.update(item_update_params)
      redirect_to root_path
    else
      redirect_to edit_item_path(params[:id]), flash: { alert: "編集に失敗しました"}
    end
  end

  def destroy
    if @item.destroy
      redirect_to user_path(current_user.id)
    else
      render :show, alert: '削除に失敗しました'
    end
  end

  def search
    @q = Item.search(search_params)
    @items = @q.result(distinct: true)
    @num = @items.where(switch: "published", sold: "sale").includes(:favorites)
    @category = Category.where(ancestry: nil)
  end

  def purchase
    Payjp.api_key = "sk_test_5b7e13cb76bbe5226e8504b2"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end
  
  def move_to_index
    redirect_to root_path, flash: { alert: "ログインしてください"} unless user_signed_in?
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  # 消すかも
  def set
    @category_grandchildren_pulldown = Category.find_by(name: "#{params[:child_name]}").children
  end

  def check_user
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id
    else
      redirect_to root_path
    end
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

  def item_update_params
    params.require(:item)
          .permit(:name,
                  :info,
                  :status,
                  :category_id,
                  :switch,
                  :value,
                  :sold,
                  :id,
                  images_attributes: [
                    :image, 
                    :_destroy, 
                    :id
                  ],
                  brand_attributes:[
                    :name,
                    :id
                  ],
                  shipment_attributes:[
                    :delivery_burden,
                    :prefecture_id,
                    :days,
                    :id
                  ])
          .merge(user_id: current_user.id)
  end

  def search_params
    params.require(:q).permit(:name_cont, :category_id_eq, :brand_name_cont, :value_gteq, :value_lteq)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
