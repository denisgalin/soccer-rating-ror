# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :players, only: %i[index show] do
    resources :stats, only: :create
  end
end
