Rails.application.routes.draw do
  root to: "homepage#index"

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
