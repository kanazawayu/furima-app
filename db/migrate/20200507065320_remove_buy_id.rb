class RemoveBuyId < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :buy, index: true
    remove_foreign_key :items, :buy
  end
end
