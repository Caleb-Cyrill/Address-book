Rails.application.routes.draw do
  resources :phone_numbers
  resources :emails
  resources :addresses
  resources :people
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
