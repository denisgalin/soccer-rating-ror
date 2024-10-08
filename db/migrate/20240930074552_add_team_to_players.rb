# frozen_string_literal: true

class AddTeamToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_reference :players, :team, null: false, foreign_key: true
  end
end
