Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:edit, :update]
    get "/dashboard", to: "users#show"
  end

  resources :users, only: [:new, :create]
  get "/animals" => "animals#index"
  patch "/visits/plus" => "visit_animals#plus"
  patch "/visits/minus" => "visit_animals#minus"
  get "/login" => "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show"
  root to: "animals#index"
  resources :durations, only: [:update]
  resources :favorite_animals, only: [:create, :destroy]
  resources :visit_animals, only: [:create, :destroy]
  resources :visits, only: [:index, :new, :create, :show]

  get "/favorites", to: "favorite_animals#index"
  get "/animals/:id", to: "animals#show", as: :animal
  get "/:type", to: "species#show"
end
