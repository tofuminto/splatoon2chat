Rails.application.routes.draw do
  devise_for :users
  root to: "chats#index"
  resources :chats, only: [:index, :create]
  namespace :api do
    resources :chats, only: :index, defaults: { format: 'json' }
  end
  resources :users, only: :show
end
