class ChangePhonesCalam < ActiveRecord::Migration[5.2]
  def change
    def change
      remove_column :addresses, :phone_number, :integer
      add_column :addresses, :phone_number, :string
    end
  end
end
