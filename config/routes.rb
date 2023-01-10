Rails.application.routes.draw do
  resources :people do 
    resources :emails, module: :people
    resources :addresses, module: :people
    resources :phone_numbers, module: :people
  end
  
  mount API::Base, at: "/"
  root 'home#index'
  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
  delete 'deleteaccount', to: 'sessions#destroyaccount'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end