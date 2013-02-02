Poker::Application.routes.draw do
  devise_for :users

  resources :users, only: [ :show ]
  resources :bots, only: [ :index, :new, :create, :edit, :update ]
  resources :games, only: [ :new, :create, :show ]
  resources :hand_histories, only: []

  root :to => 'bots#new'
end
