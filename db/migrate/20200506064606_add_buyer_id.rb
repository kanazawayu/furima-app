class AddBuyerId < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :buy, foreign_key: true
  end
end
