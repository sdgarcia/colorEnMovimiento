ColorEnMovimiento::Application.routes.draw do
  resources  :cities
 
  match '/auth/google/callback', to: 'sessions#create'
  match '/' => 'static_pages#home', :via => :get
  match '/' => 'static_pages#contact', :via => :post
  match '/votes' => 'votes#create', :via => :post
  match '/votes' => 'votes_admin#index', :via => :get
  match 'votes_admin/:id' => 'votes_admin#detail', :via => :get
  match 'votes_admin' => 'votes_admin#index', :via => :get
  get '/logout', :to => 'sessions#destroy'
  get '/admin', :to => 'admin#home'
  get '/admin/:action', :to => 'admin'
end
