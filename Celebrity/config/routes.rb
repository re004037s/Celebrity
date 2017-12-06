Rails.application.routes.draw do
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  resources :users
  resources :feedbacks, only: [:create, :update, :destroy]
  
  resources :movies do
    get 'sort', on: :collection
  end
  resources :movie_categories do
    get 'sort', on: :collection
  end

  root 'top#index'

  get '/progate', to: 'static_pages#progate'
  post '/progate', to: 'static_pages#progate'
  get '/railstutorial', to: 'static_pages#railstutorial'
  get '/portfolio', to: 'users#portfolio'
  get '/qa', to: 'static_pages#qa'
  
  patch '/html_css_status', to: 'html_css_statuses#update'
  patch '/javascript_status', to: 'javascript_statuses#update'
  patch '/ruby_status', to: 'ruby_statuses#update'
  patch '/rubyonrails_status', to: 'rubyonrails_statuses#update'
  patch '/railstutorial_status', to: 'railstutorial_statuses#update'
end
