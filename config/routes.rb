Rails.application.routes.draw do
  resources :movements
  resources :clientes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'clientes#index'
end
