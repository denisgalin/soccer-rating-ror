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
end
