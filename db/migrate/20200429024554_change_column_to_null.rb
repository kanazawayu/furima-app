class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :images, :image, true
  end
end
