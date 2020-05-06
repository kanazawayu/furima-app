class ChangeUserIdcolum < ActiveRecord::Migration[5.2]
  def change
    remove_column :credits, :user_id, :integer
    add_reference :credits, :user, foreign_key: true
  end
end
