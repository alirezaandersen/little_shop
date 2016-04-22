Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get "/animals" => "animals#index"

  get "/login" => "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  root to: "animals#index"
  resources :favorite_animals, only: [:create, :destroy]
  resources :visit_animals, only: [:create, :destroy]
  resources :visits, only: [:index, :new, :create]

  get "/favorites", to: "favorite_animals#index"
  get "/animals/:id", to: "animals#show", as: :animal
  get "/:type", to: "species#show"
end
