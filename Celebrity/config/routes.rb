Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'

  get '/signup', to:'users#new'
  post '/signup', to:'users#create'

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  get 'skillsheets/index'
  get 'skillsheets/download'
  get 'skillsheets/update_skillsheet'
  resources :users do
      member do
        get 'get_image'
        get 'get_skillsheet'
    end
  end
  resources :account_activations, only: [:edit]
  resources :feedbacks, only: [:create, :update, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  resources :movies do
    get 'sort', on: :collection
  end
  resources :movie_categories do
    get 'sort', on: :collection
  end
    
  resources :skillsheets
  get '/get_skillsheet', to: 'skillsheets#get_skillsheet'
  resources :terms do
    collection do
      get 'ajax_search'
    end
  end

  resources :pdca_posts do 
    collection do
        get 'get_image'
    end
  end
  
  resources :qiita_posts do
    collection do
        get 'get_image'
    end
  end
  
  resources :interview_posts do
    collection do
        get 'get_image'
    end
  end
  
  # resources :qiita_posts do
  #   collection do
  #       get 'get_image'
  #   end
  # end
  
  post '/tag_new', to: 'users#tag_new'
  delete '/tag_delete', to: 'users#tag_delete'
  
  patch '/post_pic', to:'users#update_picture'
  patch '/tag_edit', to:'users#tag_edit' #追加
  patch '/tag_show', to:'users#tag_show' #追加 sugi
  delete '/delete_tag', to: 'users#tag_delete' #temp post⇨deleteに変更しshow.htmlと統一
  patch '/post_skillsheet', to: 'skillsheets#update_skillsheet'
  root 'top#index'
  
  get '/information', to: 'information#show'
  post '/information', to: 'information#create', as: 'create_information'
  patch '/information', to: 'information#update'
  delete '/information', to: 'information#destroy'

  get '/progate', to: 'static_pages#progate'
  post '/progate', to: 'static_pages#progate'
  get '/railstutorial', to: 'static_pages#railstutorial'
  get '/portfolio', to: 'portfolio_comments#portfolio'
  post '/comments/create', to: 'portfolio_comments#create'
  post '/comments/:id/destroy', to: 'portfolio_comments#destroy'
  get '/qa', to: 'static_pages#qa'
  get '/pdca_post/get_image/:id', to: 'pdca_posts#get_image'
  get '/portfolio_mv', to: 'static_pages#portfolio_mv'
  patch '/html_css_status', to: 'html_css_statuses#update'
  patch '/html_css_status_schedule', to: 'html_css_statuses#update_schedule', as: 'html_css_schedule'
  patch '/html_css_status_completion', to: 'html_css_statuses#update_completion', as: 'html_css_completion'
  patch '/javascript_status', to: 'javascript_statuses#update'
  patch '/javascript_status_schedule', to: 'javascript_statuses#update_schedule', as: 'javascript_schedule'
  patch '/javascript_status_completion', to: 'javascript_statuses#update_completion', as: 'javascript_completion'
  patch '/ruby_status', to: 'ruby_statuses#update'
  patch '/ruby_status_schedule', to: 'ruby_statuses#update_schedule', as: 'ruby_schedule'
  patch '/ruby_status_completion', to: 'ruby_statuses#update_completion', as: 'ruby_completion'
  patch '/rubyonrails_status', to: 'rubyonrails_statuses#update'
  patch '/rubyonrails_status_schedule', to: 'rubyonrails_statuses#update_schedule', as: 'rubyonrails_schedule'
  patch '/rubyonrails_status_completion', to: 'rubyonrails_statuses#update_completion', as: 'rubyonrails_completion'
  patch '/railstutorial_status', to: 'railstutorial_statuses#update'
  patch '/railstutorial_status_schedule', to: 'railstutorial_statuses#update_schedule', as: 'railstutorial_schedule'
  patch '/user_movie_status', to: 'user_movie_statuses#update'
  patch '/user_movie_status_schedule', to: 'user_movie_statuses#update_schedule', as: 'user_movie_schedule'
end
