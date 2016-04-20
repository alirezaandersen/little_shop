Rails.application.routes.draw do

  get '/animals' => 'animals#index'
  root "animals#index"
  get '/', to: "animals#index"
  resources :cart_animals, only: [:create, :destroy]
  get '/cart', to: "cart_animals#index"
  get '/animals/:id', to: "animals#show"
  get '/:type', to: "species#show"
  get 'animals/cats' =>'animals#index'
  get 'animals/dogs' =>'animals#index'
end
