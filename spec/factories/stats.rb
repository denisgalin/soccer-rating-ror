# frozen_string_literal: true

FactoryBot.define do
  factory :stat do
    goals { 0 }
    assists { 0 }
    shots { 0 }
    passes { 0 }
    saves { 0 }
    association :player
  end
end
