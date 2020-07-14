Rails.application.routes.draw do
  root to: "sessions#index"

  get '/sign_up', to: "users#new"
  post '/sign_up', to: "users#create"
  get '/log_in', to: "sessions#new"
  post '/log_in', to: "sessions#create"
  get '/auth/:provider/callback', to: 'sessions#create_omniauth'
  get '/log_out', to: "sessions#destroy"
  delete '/log_out', to: "sessions#destroy"
  get '/all_countries', to: "countries#index"
  get '/all_trips' , to: "trips#index"
  get '/all_jetsetters', to: "users#index"

  resources :users do
    resources :trips do
      resources :favorite_trips, only: [:create, :destroy]
      resources :activities, only: [:new, :create, :edit, :update, :destroy]
    end
    resources :favorite_trips, only: :index
  end

  

  resources :countries, only: [:index, :show] do
    resources :cities, only: :show do 
      resources :trips, only: [:index, :show]   
    end
  end
end
