# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatsController, type: :controller do
  let!(:team) { create(:team, name: 'FC Defaults') }
  let!(:player) { create(:player, name: 'John Doe', role: 'forward', team:) }

  describe 'POST #create' do
    let(:stat_params) do
      {
        stat: {
          goals: 2,
          assists: 1,
          shots: 3,
          passes: 5,
          saves: 0
        }
      }
    end

    it 'adds statistics for the player' do
      expect do
        post :create, params: { player_id: player.id, stat: stat_params[:stat] }
      end.to change { player.stats.count }.by(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({ 'message' => 'Stat creation successful' })
    end
  end
end
