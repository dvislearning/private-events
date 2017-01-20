Rails.application.routes.draw do

  get '/home', to:'static_pages#home'

  get '/about', to: 'static_pages#about'

  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'static_pages#home' 

  resources :users, only: [:new, :show, :create]
  resources :events, only: [:new, :show, :create, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
