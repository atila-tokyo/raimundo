Rails.application.routes.draw do
  get 'photo_album/index'
  devise_for :users 
  root to: 'pages#home'
  resources :reminders
  resources :chatrooms do
    resources :messages, only: %i[create]
    resources :guests, only: %i[index update destroy]
  end
  resources :photo_albums, only: %i[ index create update ]
end
