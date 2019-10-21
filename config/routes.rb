Rails.application.routes.draw do
  root to: "countries#index"

  get '/sign_up', to: "users#new"
  post '/sign_up', to: "users#create"
  get '/log_in', to: "sessions#new"
  post '/log_in', to: "sessions#create"
  get '/auth/google_oauth2/callback', to: 'sessions#create_omniauth'
  get '/log_out', to: "sessions#destroy"
  delete '/log_out', to: "sessions#destroy"
  get '/all_trips' , to: "trips#index"
  get '/all_jetsetters', to: "users#index"

  resources :users do
    resources :trips, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :favorite_trips, only: [:create, :destroy]
    end
    resources :favorite_trips, only: :index
  end

  resources :activities, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :countries, only: [:index, :show] do
    resources :cities, only: [:index, :show] do 
      resources :trips, only: [:index, :show] do
        resources :activities, only: [:index, :show]
      end
    end
  end
end
