Rails.application.routes.draw do

  get    "/admin/users/:id/edit", to: "admin/users#edit", as: :edit_admin_user
  patch  "/admin/users/:id", to:  "admin/users#update", as: :admin_user
  put    "/admin/users/:id", to:  "admin/users#update"
  get    "/admin/dashboard", to: "admin/users#show", as: :admin_dashboard
  post   "/admin/animals", to: "admin/animals#create", as: :admin_animals
  get    "/admin/animals/new", to: "admin/animals#new", as: :new_admin_animal
  get    "/admin/animals/:id/edit", to: "admin/animals#edit", as: :edit_admin_animal
  patch  "/admin/animals/:id", to: "admin/animals#update", as: :admin_animal
  put    "/admin/animals/:id", to: "admin/animals#update"

  get    "/users/new", to: "users#new", as: :new_user
  post   "users", to: "users#create", as: :users

  get    "/animals", to: "animals#index", as: :animals
  get    "/login", to: "sessions#new", as: :login
  post   "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get    "/dashboard", to: "users#show", as: :dashboard
  root to: "animals#index"

  patch "/durations/:id", to: "durations#update", as: :duration
  put   "/durations/:id", to: "durations#update"

  post   "/favorite_animals", to: "favorite_animals#create", as: :favorite_animals
  delete "/favorite_animals/:id", to: "favorite_animals#destroy", as: :favorite_animal
  get    "/favorites", to: "favorite_animals#index"

  post   "/visit_animals", to: "visit_animals#create", as: :visit_animals
  delete "/visit_animals/:id", to: "visit_animals#destroy", as: :visit_animal

  get  "/visits", to: "visits#index", as: :visits
  post "/visits", to: "visits#create"
  get  "/visits/new", to: "visits#new", as: :new_visit
  get  "visits/:id", to: "visits#show", as: :visit
  patch "/visits/plus", to: "visit_animals#plus", as: :visits_plus
  patch "/visits/minus", to: "visit_animals#minus", as: :visits_minus

  get "/animals/:id", to: "animals#show", as: :animal
  get "/:type", to: "species#show"
end
