Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  get "howtouse", to: "pages#howtouse"
  get "dashboard", to: "pages#dashboard"
  # get "users/:id", to: "users#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :toys do
    resources :trades, only: [:create]
  end

  resources :trades, only: [:show] do
    resources :messages, only: [:new, :create]
  end

  resources :users, only: [:show] do
    resources :reviews, only: [:create]
  end

  resources :trades do
    member do
      patch :accept
      patch :reject
    end
  end
end
