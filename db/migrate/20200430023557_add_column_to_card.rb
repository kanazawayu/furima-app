class AddColumnToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :name, :string, null: false
  end
end
