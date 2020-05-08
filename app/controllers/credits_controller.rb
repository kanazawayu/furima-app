class CreditsController < ApplicationController
 

  require "payjp"

  before_action :set_card, only: [:index, :new, :delete]

  def index #Cardのデータpayjpに送り情報を取り出します
    return redirect_to user_path(current_user.id) if user_credits_path(current_user.id) != request.fullpath
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def new
    redirect_to action: "index" unless @card.nil?
    redirect_to user_path(current_user.id) if new_user_credit_path(current_user.id) != request.fullpath
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      card = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if card.save
        redirect_to action: "index"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    if @card.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_SECRET_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "new"
  end

  def set_card
    @card = Credit.find_by(user_id: current_user.id)
  end 

  # def check_user
  #   @card = Credit.find_by(user_id: current_user.id)
  #   if user_signed_in? && current_user.id == 
  #     redirect_to user_path(current_user.id) unless User.find(params[:user_id]) == current_user
  #   else
  #     redirect_to root_path
  #   end
  # end

end
