Rails.application.routes.draw do

  get '/animals' => 'animals#index'
  root to: "animals#home"
  resources :cart_animals, only: [:create, :destroy]
  get '/favorites', to: "cart_animals#index"
  get '/animals/:id', to: "animals#show"
  get '/:type', to: "species#show"
end
