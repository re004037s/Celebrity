
Rails.application.routes.draw do
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'
  resources :users
  resources :feedbacks, only: [:create, :update, :destroy]
  
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  root 'static_pages#home'
  get '/freelance', to: 'static_pages#freelance'
  get '/program_learn', to: 'static_pages#program_learn'
  get '/able_engineer', to: 'static_pages#able_engineer'
  get '/job_hunting', to: 'static_pages#job_hunting'

  get '/progate', to: 'static_pages#progate'
  post '/progate', to: 'static_pages#progate'

  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
  get '/help', to: 'static_pages#help'
  get '/engineer', to: 'static_pages#engineer'
  get '/job', to: 'static_pages#job'
  get '/study', to: 'static_pages#study'
  root 'static_pages#home'
  

  get '/qa', to: 'static_pages#qa'
end