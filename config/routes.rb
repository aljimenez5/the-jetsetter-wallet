Rails.application.routes.draw do
  root to: "countries#index"

  get '/sign_up' => "users#new"
  post '/sign_up' => "users#create"
  get '/log_in' => "sessions#new"
  post '/log_in' => "sessions#create"
  get '/auth/google_oauth2/callback', to: 'sessions#create_omniauth'
  get '/log_out' => "sessions#destroy"
  delete '/log_out' => "sessions#destroy"
  get '/all_trips' => "homepage#index"
  get '/all_jetsetters' => "users#index"
  
  resources :users do
    resources :trips do
      resources :activities
    end
    resources :favorite_trips
  end


  resources :countries, only: [:index, :show] do
    resources :cities, only: [:index, :show] do 
      resources :trips, only: [:index, :show] do
        resources :activities, only: [:index, :show]
      end
    end
  end
end
