Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :books do
    post 'add_to_favorites', on: :member
    post 'remove_favorites', on: :member
    get 'favorites', on: :collection
  end
  resources :authors
  resources :publishers
  get 'dashboard', to: 'dashboard#dashboard'
  post 'dashboard/update_book_prices', to: 'dashboard#update_book_prices'
  get 'dashboard/books', to: 'dashboard#books'

  namespace :api do
    resources :books, only: %i[index show create update destroy]
  end

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
