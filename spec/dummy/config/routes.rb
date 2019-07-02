Rails.application.routes.draw do
  mount Talkie::Engine => '/talkie'
  root to: "pages#index"

  resources :dummy_commentables, only: [:show]
  resources :dummy_users, only: [:show]
end
