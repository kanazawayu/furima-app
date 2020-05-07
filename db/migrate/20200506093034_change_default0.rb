class ChangeDefault0 < ActiveRecord::Migration[5.2]
  def up
    
    change_column_default :items, :buy_id, default: 0
  end

  def down
    
    change_column_default :items, :buy_id, default: nil
  end
end
