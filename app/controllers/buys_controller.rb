class BuysController < ApplicationController

  require 'payjp'

  before_action :set_item, only: [:index, :pay]
  before_action :set_card, only: [:index, :pay]
  before_action :my_item, only: [:index, :pay]

  def index
    
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @default_card_information = customer.cards.retrieve(@card.card_id)
    @exp_month = @default_card_information.exp_month.to_s
    @exp_year = @default_card_information.exp_year.to_s.slice(2,3)
    @brand = @default_card_information.brand
    @brand = @brand.downcase
    @url = "//pcweb-assets.mercdn.net/assets/img/card/#{@brand}.svg?1536441709"
    if @exp_month.length == 1
      @exp_month = "0"+@exp_month
    end
  end

  def pay
    if @item.sold == 'sale'
      @buy = Buy.new(user_id: current_user.id)
      @buy.save!
      @item.sold = 2
      @item.buy_id = @buy.user_id
      @item.save!
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      Payjp::Charge.create(
      :amount => @item.value, #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => @card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
      )
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  def show
  end
  # 念のため残してます
  # def pay
  #   unless @product.soldout
  #     @card = Card.find_by(user_id: current_user.id)
  #     @product.soldout = true
  #     @product.save!
  #     Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  #     Payjp::Charge.create(
  #     amount: @product.price,
  #     customer: @card.customer_id,
  #     currency: 'jpy'
  #     )
  #   else
  #     redirect_to product_path(@product)
  #   end
  # end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def set_card
    @card = Credit.find_by(user_id: current_user.id)
  end

  def my_item
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
