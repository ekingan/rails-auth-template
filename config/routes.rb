Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'users/new'

  get 'users/create'

  get 'users/show'

  root to: "welcome#index"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/signup", to: "users#new", as: "signup"

  get 'sessions/destroy'

  get '/logout', to: 'sessions#destroy', as: :logout
  
  resources :users
end
