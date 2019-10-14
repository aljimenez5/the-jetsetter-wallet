Rails.application.routes.draw do
  root to: "countries#index"

  get '/sign_up' => "users#new"
  post '/sign_up' => "users#create"
  get '/log_in' => "sessions#new"
  post '/log_in' => "sessions#create"
  resources :users, only: [:destroy]
  resources :sessions, only: [:destroy]
  
  resources :users, only: [:show] do
    resources :trips do
      resources :activities
    end
  end

  resources :countries, only: [:show] do
    resources :cities, only: [:show] do 
      resources :trips, only: [:show] do
        resources :activities, only: [:show]
      end
    end
  end
end
