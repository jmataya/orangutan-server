OrangutanServer::Application.routes.draw do
  resources :users do
    resources :workspaces
  end

  root to: 'static_pages#home'
end
