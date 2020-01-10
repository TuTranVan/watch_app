Rails.application.routes.draw do
  root "sanphams#index"

  namespace :admin do
    root "static_pages#index"
    resources :loaisps, except: :show
    resources :sanphams
    resources :nguoidungs, except: :show
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

  get "/signup", to: "nguoidungs#new"
  post "/signup", to: "nguoidungs#create"

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
  resources :nguoidungs
  resources :binhluans, only: %i(create destroy)
end
