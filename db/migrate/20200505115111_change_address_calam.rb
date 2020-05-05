class ChangeAddressCalam < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :address_number, :integer, null: false
    add_column :addresses, :address_number, :string, null: false
  end
end
