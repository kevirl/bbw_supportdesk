Rails.application.routes.draw do
  # get 'sessions/new'

  get 'accounts/new'

  resources :ticket_types
  resources :products
  resources :statuses
  get 'static_pages/admin'

  get 'static_pages/home'

  get 'about' => 'static_pages#about'
  
  get 'contact' => 'static_pages#contact_us'
  
  get 'signup' => 'accounts#new'
  
  get 'login'=> 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :accounts

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # root 'application#hello'
  root 'static_pages#home'

 
end
