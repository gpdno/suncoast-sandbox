Rails.application.routes.draw do
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  #get '/contact', to: 'pages#contact'
  get '/terms', to: 'pages#terms'
  get '/privacy', to: 'pages#privacy'
  get '/faq', to: 'pages#faq'
  
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]
  
  get '/services/engineer', to: 'services#engineer'
  get '/services/design', to: 'services#design'
  get '/services/prototype', to: 'services#prototype'
  get '/services/visualization', to: 'services#visualization'

  resources :articles

  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


end
