Rails.application.routes.draw do
  root "books#index"

  namespace :admin do
    root "static_pages#index"
    resources :categories, except: :show
    resources :books
    resources :users, except: :show
    resources :imports, only: [:create, :index, :destroy]
    resources :requests, except: [:new, :create, :edit] do
      member do
        get :confirm
      end
    end
  end

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :categories, only: :show
  resources :books
  resources :carts, only: :index do
    member do
      get :add_to_cart
      get :remove_cart
    end
    collection do
      get :empty_cart
    end
  end
  resources :requests, only: [:create, :show]
  resources :users
  resources :comments, only: %i(create destroy)
end
