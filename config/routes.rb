Rails.application.routes.draw do
  resources :phone_numbers, path: :phone
  resources :emails
  resources :addresses, path: :address
  resources :people
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
