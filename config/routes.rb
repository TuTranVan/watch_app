Rails.application.routes.draw do
  root "books#index"

  namespace :admin do
    root "static_pages#index"
    resources :loaisps, except: :show
    resources :sanphams
    resources :users, except: :show
    resources :nhaphangs, only: [:create, :index, :destroy]
    resources :requests, except: [:new, :create, :edit] do
      member do
        get :confirm
        get :finish
      end
    end
    resources :request_details, only: [:index] do
      member do
        get :normal
        get :damage
        get :miss
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
  resources :likes, only: %i(create destroy)
end
