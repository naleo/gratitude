Rails.application.routes.draw do
  get 'password_resets/new'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'authentications#create'
  resources :users, except: [:index, :new]
  resources :sessions, except: [:index,:edit,:update,:show,:new,:destory]
  resources :gratitude_items do
    resources :reflections
  end
  resources :password_resets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'about' => 'sites#about'
  # Defines the root path route ("/")
  root 'sites#index'
end
