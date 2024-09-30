# frozen_string_literal: true

class PlayersController < ApplicationController
  def index
    players = Player.all
    render json: players
  end

  def show
    player = Player.find(params[:id])
    render json: { player:, rating: player.rating }
  end

  def rating
    player = Player.find(params[:id])
    rating = calculate_player_rating(player)
    render json: { player_id: player.id, name: player.name, role: player.role, team: player.team.name, rating: rating }
  end

  private

  def calculate_player_rating(player)
    # логика может быть сложнее по любому из параметров; в дыннй момент ограничимся заглушкой, получающей рейтинг
    player.rating
  end
end
