class AddItemToBrand < ActiveRecord::Migration[5.2]
  def change
    add_reference :brands, :item, foreign_key: true
  end
end
