Rails.application.routes.draw do
  get 'archives/index'
  get 'password_resets/new'
  get 'password_resets/edit'
  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :groups, except: [:new] do
    resources :memos do
      get :download
    end
    get :join
    post :invite
    get :member
    get :calendar
    resources :archives, only: [:index, :show]
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
end
