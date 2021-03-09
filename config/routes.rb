Rails.application.routes.draw do
  get 'guests/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :reminders
  resources :guests, only: %i[destroy] 
  resources :chatrooms do
    resources :messages, only: %i[create]
    resources :guests, only: %i[index update]
  end
end
