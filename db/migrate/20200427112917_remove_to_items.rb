class RemoveToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :fee, :integer
    remove_column :items, :value, :integer
  end
end
