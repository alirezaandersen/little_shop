Rails.application.routes.draw do

  resources :users, only: [:new, :create]
  get '/animals' => 'animals#index'
  root to: "animals#home"

  get '/login' => 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :cart_animals, only: [:create, :destroy]
  
  get '/favorites', to: "cart_animals#index"
  get '/animals/:id', to: "animals#show"
  get '/:type', to: "species#show"

end
