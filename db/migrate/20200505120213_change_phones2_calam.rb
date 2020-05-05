class ChangePhones2Calam < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :phone_number, :integer
    add_column :addresses, :phone_number, :string
  end
end
