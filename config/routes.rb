OrangutanServer::Application.routes.draw do
	resources :tasks
  resources :users
  resources :workspaces

  root to: 'static_pages#home'
end
