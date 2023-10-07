Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'books/index', to: 'books#index', as: 'books'
  get 'dashboard', to: 'dashboard#dashboard'
  resources :dashboard do
    resources :books
    resources :authors
    resources :publishers
  end
end
