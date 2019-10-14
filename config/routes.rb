Rails.application.routes.draw do
  root to: "countries#index"

  get '/sign_up' => "users#new"
  post '/sign_up' => "users#create"
  get '/log_in' => "sessions#new"
  post '/log_in' => "sessions#create"
  get '/log_out' => "sessions#destroy"
  delete '/log_out' => "sessions#destroy"
  
  resources :users, only: [:show, :edit, :update, :destroy]
  
  
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
