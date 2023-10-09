Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :books
  resources :authors
  resources :publishers
  get 'dashboard', to: 'dashboard#dashboard'
  get 'dashboard/books', to: 'dashboard#books'
end
