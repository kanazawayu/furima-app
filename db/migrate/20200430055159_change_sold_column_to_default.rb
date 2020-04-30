class ChangeSoldColumnToDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :sold, null: false
    change_column :items, :sold, :integer, default: 0
  end
end
