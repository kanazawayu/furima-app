class BuysController < ApplicationController

  require 'payjp'

  def index
  end

  def purchase
    Payjp.api_key = ""
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end

end
