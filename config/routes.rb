Sample5App::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :stores
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles, only: [:create, :destroy, :new, :index, :show]
  resources :stores do 
    resources :articles, only: :index
  end
  resources :articles do
    resources :articles_images
  end
  root  'static_pages#home'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/signup',  to: 'stores#new',            via: 'get'
  match '/signin_',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/index_eat',  to: 'stores#index_eat',            via: 'get'
  match '/index_shopping',  to: 'stores#index_shopping',            via: 'get'
  
  # ユーザの現在位置の緯度、経度
  get '/spots/:lat/:lng' => 'spots#index'
end
