class RemoveItemToBrand < ActiveRecord::Migration[5.2]
  def change
    remove_column :brands, :user_id, :references
  end
end
