Sample5App::Application.routes.draw do
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
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/index_eat',  to: 'articles#index_eat',            via: 'get'
end
