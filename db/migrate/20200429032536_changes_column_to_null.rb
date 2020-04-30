class ChangesColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :images, :image, null: false
  end
end
