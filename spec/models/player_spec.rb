# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Player, type: :model do
  it 'calculates rating correctly for a forward' do
    player = Player.create(name: 'Test Forward', role: 'forward', team: 'Test Team')
    player.stats.create(goals: 2, assists: 1, shots: 5)

    expect(player.rating).to eq(13) # 2*3 + 1*2 + 5*1 = 13
  end
  it 'calculates rating correctly for a midfielder' do
    player = Player.create(name: 'Test Midfielder', role: 'midfielder', team: 'Test Team')
    player.stats.create(goals: 1, assists: 3, passes: 5)

    expect(player.rating).to eq(14) # 1*3 + 3*2 + 5*1 = 14
  end
  it 'calculates rating correctly for a defender' do
    player = Player.create(name: 'Test Defender', role: 'defender', team: 'Test Team')
    player.stats.create(saves: 1, passes: 7)

    expect(player.rating).to eq(17) # 1*3 + 7*2  = 17
  end
  it 'calculates rating correctly for a goalkeeper' do
    player = Player.create(name: 'Test Goalkeeper', role: 'goalkeeper', team: 'Test Team')
    player.stats.create(saves: 2, passes: 5)

    expect(player.rating).to eq(15) # 2*5 + 5*1  = 15
  end
end
