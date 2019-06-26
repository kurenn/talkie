Talkie::Engine.routes.draw do
  resources :comments, only: [:create, :destroy]
  resources :mentions, only: [:index]
end
