Rails.application.routes.draw do
  
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'

  resources :users
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  get 'static_pages/home'
  get 'qa' => 'static_pages#qa'
  get 'progate' => 'static_pages#progate'
  get 'about' => 'static_pages#about'
  get 'help' => 'static_pages#help'

end
