Rails.application.routes.draw do
  resources :users
  resources :games
  
  
  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  # get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get '/logged_in', to: 'sessions#is_logged_in?'
end
