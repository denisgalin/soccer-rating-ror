class AddRatingToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :rating, :integer
  end
end
