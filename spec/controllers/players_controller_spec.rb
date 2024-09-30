# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let!(:team) { create(:team, name: 'FC Defaults') }
  let!(:player) { create(:player, name: 'John Doe', role: 'forward', team:) }

  describe 'GET #rating' do
    before do
      create(:stat, player:, goals: 2, assists: 1, saves: 0)
    end

    it 'returns the player rating' do
      get :rating, params: { id: player.id }
      expect(response).to have_http_status(:success)

      expected_rating = (2 * 3 + 1 * 2 + 0 * 1)
      expect(JSON.parse(response.body)).to include(
        'player_id' => player.id,
        'name' => player.name,
        'role' => player.role,
        'team' => team.name,
        'rating' => expected_rating
      )
    end
  end
end
