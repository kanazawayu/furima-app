class DropCardsTeble < ActiveRecord::Migration[5.2]
  def change
    drop_table :cards
  end
end
