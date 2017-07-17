Rails.application.routes.draw do
  get '/signup', to:'users#new'

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  get 'static_pages/home'
  get 'contact' => 'static_pages#contact'
  get 'about' => 'static_pages#about'
  get 'help' => 'static_pages#help'
  get 'logout' => 'static_pages#logout'
  get 'login' => 'static_pages#login'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
