Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :test
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: "auth/registrations"
  }

  namespace :auth do
    resources :sessions, only: %i[index]
  end

  # resources :sessions, only: %i[index]
  resources :posts
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show]
  resources :users
  resources :trades, only: [:index, :show]
  
end

