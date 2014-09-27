Sample5App::Application.routes.draw do
  resources :stores
  resources :sessions, only: [:new, :create, :destroy]
  root  'static_pages#home'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/signup',  to: 'stores#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
