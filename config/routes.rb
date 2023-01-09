Rails.application.routes.draw do
   resources :sessions, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "static#home"
  # Defines the root path route ("/")
  # root "articles#index"
end
