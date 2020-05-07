class RemoveBuyColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :buy_id, :integer
  end
end
