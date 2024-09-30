class CreateStats < ActiveRecord::Migration[7.1]
  def change
    create_table :stats do |t|
      t.references :player, null: false, foreign_key: true
      t.integer :goals, default: 0
      t.integer :assists, default: 0
      t.integer :saves, default: 0
      t.integer :shots, default: 0
      t.integer :passes, default: 0

      t.timestamps
    end
  end
end
