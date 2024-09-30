class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :role
      t.string :team

      t.timestamps
    end
  end
end
