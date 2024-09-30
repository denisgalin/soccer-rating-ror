# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :team
  has_many :stats
  def rating
    case role
    when 'forward'
      stats.sum { |s| s.goals * 3 + s.assists * 2 + s.shots * 1 }
    when 'midfielder'
      stats.sum { |s| s.goals * 3 + s.assists * 2 + s.passes * 1 }
    when 'defender'
      stats.sum { |s| s.saves * 3 + s.passes * 2 }
    when 'goalkeeper'
      stats.sum { |s| s.saves * 5 + s.passes * 1 }
    else
      0
    end
  end
end
