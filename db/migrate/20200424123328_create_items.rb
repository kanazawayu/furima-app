class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      # t.string :name,  null: false
      # t.text :info,    null: false
      # t.integer :status, null: false, default: 0
      # t.integer :value, null:false
      # t.integer :fee, null:false
      # t.integer :return, null:false
      # t.references :category, foreign_key: true
      # t.references :brand, foreign_key: true
      # t.references :shipment, foreign_key: true
      # t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
