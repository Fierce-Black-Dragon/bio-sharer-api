Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  post :profile_update, to: "sessions#update"
  get '/dashboard/:id', to: 'dashboard#set_user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "static#home"
  # Defines the root path route ("/")
  # root "articles#index"
end
