class BuysController < ApplicationController

  require 'payjp'

  def index
    @item = Item.find(params[:item_id])

    card = Credit.where(user_id: current_user.id).first

   
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
    
    
  end

  def pay
    @item = Item.find(params[:item_id])
    unless @item.sold == 2
      @buy = Buy.new(user_id: current_user.id)
      @buy.save!
      @item.sold = 2
      @item.buy_id = @buy.user_id
      @item.save!
      card = Credit.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      Payjp::Charge.create(
      :amount => @item.value, #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
      )
      redirect_to user_path(current_user.id)
    else
      redirect_to root_path
    end
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
end
