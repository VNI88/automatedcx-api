require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  devise_scope :user do
    root to: 'landing_page#index'
  end

  authenticate :user do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    mount Sidekiq::Web => '/sidekiq'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  mount StatusPage::Engine, at: '/'

  resources :routines, only: %i[index create show update destroy]
  resources :events, only: %i[index create show update destroy]

  get 'ping',     to: 'ping#show'
  get 'version',  to: 'version#show'

  post 'messages',      to:'messages#new'
  post 'notifications', to: 'notifications#new'

  namespace :chatbot do
    post 'dialog_flow', to: 'dialog_flowr#create'
    post 'whatsapp', to: 'whatsapp#create'
  end
end
