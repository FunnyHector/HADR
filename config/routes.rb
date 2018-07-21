# frozen_string_literal: true

Rails.application.routes.draw do
  root "homepage#index", as: "homepage"

  resources :users, only: [:create, :show]
end
