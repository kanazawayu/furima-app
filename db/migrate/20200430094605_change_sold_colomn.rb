class ChangeSoldColomn < ActiveRecord::Migration[5.2]
  def up
    change_column_null :items, :sold, false, 0
    change_column :items, :sold, :integer, default: 0
  end

  def down
    change_column_null :items, :sold, false, nil
    change_column :items, :sold, :integer, default: nil
  end
end
