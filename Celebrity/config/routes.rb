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
  
  patch '/post_pic', to:'users#edit_profile_pic'

  get '/progate', to: 'static_pages#progate'
  post '/progate', to: 'static_pages#progate'
  get '/railstutorial', to: 'static_pages#railstutorial'
  get '/qa', to: 'static_pages#qa'
  
  patch '/html_css_status', to: 'html_css_statuses#update'
  patch '/html_css_status_schedule', to: 'html_css_statuses#update_schedule', as: 'html_css_schedule'
  patch '/javascript_status', to: 'javascript_statuses#update'
  patch '/javascript_status_schedule', to: 'javascript_statuses#update_schedule', as: 'javascript_schedule'
  patch '/ruby_status', to: 'ruby_statuses#update'
  patch '/ruby_status_schedule', to: 'ruby_statuses#update_schedule', as: 'ruby_schedule'
  patch '/rubyonrails_status', to: 'rubyonrails_statuses#update'
  patch '/rubyonrails_status_schedule', to: 'rubyonrails_statuses#update_schedule', as: 'rubyonrails_schedule'
  patch '/railstutorial_status', to: 'railstutorial_statuses#update'
  patch '/railstutorial_status_schedule', to: 'railstutorial_statuses#update_schedule', as: 'railstutorial_schedule'
  patch '/user_movie_status', to: 'user_movie_statuses#update'
  patch '/user_movie_status_schedule', to: 'user_movie_statuses#update_schedule', as: 'user_movie_schedule'
end
