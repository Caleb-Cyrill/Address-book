Rails.application.routes.draw do
  get 'user/create'
  get 'user/new'
  get 'user/index'
  resources :phone_numbers, path: :phone
  resources :emails
  resources :addresses, path: :address
  resources :people
  root 'home#index'
  get '/signup' => 'user#new'
  post '/users' => 'user#create'
  get '/' => 'user#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
