Rails.application.routes.draw do
  get "signup" => "users#new"
  get "login" => "sessions#new"
  resources :users, except: [:index, :new]
  resources :sessions, except: [:index,:edit,:update,:show,:new]
  resources :gratitude_items do
    resources :reflections
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about" => "sites#about"
  # Defines the root path route ("/")
  root "sites#index"
end
