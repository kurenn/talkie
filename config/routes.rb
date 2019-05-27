Talkie::Engine.routes.draw do
  resources :comments, only: [:create, :destroy]
end
