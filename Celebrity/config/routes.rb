Rails.application.routes.draw do
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  resources :users

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  get '/qa', to: 'static_pages#qa'
  get '/progate', to: 'static_pages#progate'
  post '/progate', to: 'static_pages#progate'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'

  root 'static_pages#home'
  
end
