class AddSwitchToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :switch, :integer, default: 0, null: false
  end
end
