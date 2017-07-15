Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/qa'
  get 'contact' => 'static_pages#contact'
  get 'about' => 'static_pages#about'
  get 'help' => 'static_pages#help'
  get 'login' => 'static_pages#login'
  get 'signup' => 'static_pages#signup'
  get 'logout' => 'static_pages#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
