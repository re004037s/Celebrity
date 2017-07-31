Rails.application.routes.draw do
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  resources :users

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  get 'static_pages/qa'
  get '/static_pages/new' => 'static_pages#update_time'
  post '/static_pages/new' => 'static_pages#update_time'

  get '/contact' => 'static_pages#contact'
  get '/about' => 'static_pages#about'
  get '/help' => 'static_pages#help'

  root 'static_pages#home'
  
end
