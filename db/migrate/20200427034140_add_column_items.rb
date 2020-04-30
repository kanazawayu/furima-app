class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :name,      :string, null: false
    add_column :items, :info,      :text, null: false
    add_column :items, :status,    :integer, null: false, default: 0
    add_column :items, :value,     :integer, null: false
    add_column :items, :fee,       :integer, null: false
    add_column :items, :return,    :integer, null: false
    add_reference :items, :category, foreign_key: true
    add_reference :items, :brand,    foreign_key: true
    add_reference :items, :shipment, foreign_key: true
    add_reference :items, :user,     foreign_key: true
  end
end
