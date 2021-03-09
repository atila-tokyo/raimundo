Rails.application.routes.draw do
  devise_for :users do 
    resources :photo_gallery
  end
  root to: 'pages#home'
  resources :reminders
  resources :chatrooms do
    resources :messages, only: %i[create]
    resources :guests, only: %i[index update destroy]
  end
end
