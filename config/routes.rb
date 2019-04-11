Rails.application.routes.draw do
  root "static_pages#home"

  namespace :admin do
    root "static_pages#index"
    resources :authors, except: :show
    resources :publishers, except: :show
    resources :categories, except: :show
    resources :books
    resources :users, except: :show
    resources :imports, only: [:create, :index, :destroy]
  end

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
