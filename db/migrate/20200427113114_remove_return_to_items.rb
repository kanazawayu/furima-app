class RemoveReturnToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :return, :integer
  end
end
