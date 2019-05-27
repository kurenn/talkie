Rails.application.routes.draw do
  root to: "application#show"
  resources :dummy_commentables, only: [:show]
end
