Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :test
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth'

  # resources :sessions, only: %i[index]
  resources :posts
end

