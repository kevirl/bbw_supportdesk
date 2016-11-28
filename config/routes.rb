Rails.application.routes.draw do
  resources :tickets
  resources :accounts
  resources :ticket_types
  resources :products
  resources :statuses
  
  get 'static_pages/admin'

  get 'home' => 'static_pages#home'

  get 'about' => 'static_pages#about'
  
  get 'contact' => 'static_pages#contact_us'
  
  get 'signup' => 'accounts#new'
  
  get 'ticket' => 'tickets#new'
  
  get 'login'=> 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  # get 'sessions/new'

  # get 'accounts/new'
  
  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # root 'application#hello'
  #root 'static_pages#home'
  root 'sessions#new'

 
end
