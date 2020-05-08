class DraftsController < ApplicationController
  def index
    @item = Item.all
  end
end
