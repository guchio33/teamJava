Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :test, only: %i[index]
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth',controllers:{
    registrations: 'register'
  }

  resources :sessions, only: %i[index]
end

