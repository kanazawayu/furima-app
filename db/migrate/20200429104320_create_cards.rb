class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.bigint :number,    null: false
      t.integer :year,      null: false
      t.integer :month,     null: false
      t.integer :code,      null: false
      t.references :user,   foreign_key: true
      t.timestamps
    end
    add_index :cards, :number,             unique: true
  end
end
