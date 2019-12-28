Rails.application.routes.draw do
  root "sanphams#index"

  namespace :admin do
    root "static_pages#index"
    resources :loaisps, except: :show
    resources :sanphams
    resources :users, except: :show
    resources :nhaphangs, only: [:create, :index, :destroy]
    resources :donhangs, except: [:new, :create, :edit] do
      member do
        get :finish
      end
      collection do
        post :confirm
      end
    end
  end

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :loaisps, only: :show
  resources :sanphams
  resources :carts, only: :index do
    member do
      get :add_to_cart
      get :remove_cart
    end
    collection do
      post :update_cart
      get :empty_cart
    end
  end
  resources :donhangs, only: [:create, :show]
  resources :users
  resources :binhluans, only: %i(create destroy)
end
