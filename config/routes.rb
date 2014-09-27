Sample5App::Application.routes.draw do
  resources :stores
  root  'static_pages#home'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/signup',  to: 'stores#new',            via: 'get'
end
