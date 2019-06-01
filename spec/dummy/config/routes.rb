Rails.application.routes.draw do
  root to: "pages#index"

  resources :dummy_commentables, only: [:show]
  resources :dummy_users, only: [:show]

  mount Talkie::Engine => '/talkie'
end
