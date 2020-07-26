Talkie::Engine.routes.draw do
  resources :comments, only: [:create, :destroy] do
    resources :replies, only: [:index]
  end

  if Talkie.mentions_enabled?
    resources :mentions, only: [:index]
  end
end
