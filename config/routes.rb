Rails.application.routes.draw do
  root "static_pages#home"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users
  resources :groups, only: [:index, :new, :show, :create] do
    resources :memos, only: [:create, :show, :index]
    get :join
    post :invite
    get :member
  end
end
