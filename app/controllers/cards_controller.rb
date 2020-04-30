class CardsController < ApplicationController

  def index
    # @user = User.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.save
    redirect_to user_path(current_user.id)
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    card = Card.find(params[:id])
    card.update(card_params)
  end

  def destroy
  end

  private
  def card_params
    params.permit(:number, :year, :month, :code).merge(user_id: current_user.id)
  end

end
