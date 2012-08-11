Assessment::Application.routes.draw do
  resources :customers, except: [ :edit, :update, :destroy ]
  resources :orders, except: [ :edit, :update, :destroy ]

  root to: "customers#new"
end
