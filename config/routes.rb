require 'sidekiq/web'

Rails.application.routes.draw do
  # devise_for :users
  resources :users
  root 'sessions#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'

  get 'sign_in',  to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out',  to: 'sessions#destroy'
  get 'ping',     to: 'ping#show'
  get 'version',  to: 'version#show'
end
