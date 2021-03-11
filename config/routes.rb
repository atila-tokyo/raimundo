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
  resources :photo_albums do
    member do
      delete :delete_image_attachment
    end
  end
end
