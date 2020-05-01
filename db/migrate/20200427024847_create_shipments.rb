class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.integer :delivery_burden, null:false, default:0
      t.integer :days, null:false, default:0
      t.integer :prefecture_id, foreign_key: true
      t.timestamps
    end
  end
end
