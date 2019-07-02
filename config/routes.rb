Talkie::Engine.routes.draw do
  resources :comments, only: [:create, :destroy]

  if Talkie.mentions_enabled?
    resources :mentions, only: [:index]
  end
end
