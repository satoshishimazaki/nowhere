Sample5App::Application.routes.draw do
  devise_for :users, :controllers => {
  :sessions => 'users/sessions',
  :omniauth_callbacks => "users/omniauth_callbacks" 
  }
  devise_scope :user do get "/user_signout" => "devise/sessions#destroy" end
  resources :users, :only => [:index, :show] do
    member do
      get :favorite
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :stores
  resources :sessions, only: [:new, :create, :destroy]
  resources :articles
  resources :stores do 
    resources :articles, only: [:new, :show, :index, :create, :edit, :update]
  end
  resources :articles do
    resources :articles_images
  end
  resources :favorites, only: [:create, :destroy]
  root  'articles#index'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/sample',   to: 'static_pages#sample',   via: 'get'
  match '/sample_sample',   to: 'static_pages#sample_sample',   via: 'get'
  match '/menu_sample',   to: 'static_pages#menu_sample',   via: 'get'
  match '/signup',  to: 'stores#new',            via: 'get'
  match '/signin_',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/index_eat',  to: 'stores#index_eat',            via: 'get'
  match '/index_shopping',  to: 'stores#index_shopping',            via: 'get'
  # match '/ajax_index', to: 'stores#ajax_index', via: 'post'
  match '/ajax_index', to: 'articles#ajax_index', via: 'get'
  match '/upload', to: 'article_images#upload', via: 'get'
end
