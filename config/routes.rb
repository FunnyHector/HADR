# frozen_string_literal: true

Rails.application.routes.draw do
  root "homepage#index", as: "homepage"

  resources :users, only: [:create, :show]
  resources :requests, only: [:create, :show]
  resources :offers, only: [:create, :show]
end
