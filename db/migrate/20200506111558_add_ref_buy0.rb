class AddRefBuy0 < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :buy, foreign_key: true, default: 0
  end
end
