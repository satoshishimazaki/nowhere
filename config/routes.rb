Sample5App::Application.routes.draw do
  root  'static_pages#home'
  match '/about',   to: 'static_pages#about',   via: 'get'
end
