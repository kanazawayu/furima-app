class AdditemToShipment < ActiveRecord::Migration[5.2]
  def change
    add_reference :shipments, :item, foreign_key: true
  end
end
