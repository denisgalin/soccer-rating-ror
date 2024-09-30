# frozen_string_literal: true

class StatsController < ApplicationController
  def create
    player = Player.find(params[:player_id])
    stat = player.stats.new(stat_params)

    if stat.save
      RatingCalculatorJob.perform_async(player.id)
      render json: { message: 'Stat creation successful' }, status: :created
    else
      render json: { errors: stat.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def stat_params
    params.require(:stat).permit(:goals, :assists, :shots, :passes, :saves)
  end
end
