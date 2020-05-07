class AddBuyid < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :buy_id, :integer, default: 0
  end
end
