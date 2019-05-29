Rails.application.routes.draw do
  root to: "pages#index"

  resources :dummy_commentables, only: [:show]

  mount Talkie::Engine => '/talkie'
end
