Assessment::Application.routes.draw do
  resources :customers, except: [ :edit, :update, :destroy ]
  resources :orders, except: [ :edit, :update, :destroy ]
end
