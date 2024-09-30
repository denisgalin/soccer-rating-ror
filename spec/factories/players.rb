# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    name { 'John Doe' }
    role { 'forward' }
    association :team
  end
end
