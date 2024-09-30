# frozen_string_literal: true

class PlayersController < ApplicationController
  def index
    # Исполнение без пагинации
    # players = Player.all
    # render json: players
    players = Player.page(params[:page]).per(2)
    render json: players, meta: pagination_meta(players)
  end

  def show
    player = Player.find(params[:id])
    render json: { player:, rating: player.rating }
  end

  def rating
    player = Player.find(params[:id])
    # исполнение без кэширования
    # rating = calculate_player_rating(player)
    rating = Rails.cache.fetch("player_rating/#{player.id}", expires_in: 1.hours) do
      calculate_player_rating(player)
    end
    render json: { player_id: player.id, name: player.name, role: player.role, team: player.team.name, rating: rating }
  end

  private

  def calculate_player_rating(player)
    # логика может быть сложнее по любому из параметров; в дыннй момент ограничимся заглушкой, получающей рейтинг
    player.rating
  end

  def pagination_meta(players)
    {
      current_page: players.current_page,
      next_page: players.next_page,
      prev_page: players.prev_page,
      total_pages: players.total_pages,
      total_count: players.total_count
    }
  end
end
