# frozen_string_literal: true

class RatingCalculatorJob
  include Sidekiq::Job

  def perform(player_id)
    player = Player.find(player_id)
    player.update(rating: player.rating)
  end
end
