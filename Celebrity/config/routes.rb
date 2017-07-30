Rails.application.routes.draw do
  get '/home', :to =>'static_pages#home' 
  
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'

  resources :users
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  get 'static_pages/qa'
  get 'progate' => 'static_pages#progate'
  get '/contact' => 'static_pages#contact'
  get '/about' => 'static_pages#about'
  get '/help' => 'static_pages#help'

end
