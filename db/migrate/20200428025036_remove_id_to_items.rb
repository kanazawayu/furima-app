class RemoveIdToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :brand_id, :references
    remove_column :items, :shipment_id, :references
  end
end
