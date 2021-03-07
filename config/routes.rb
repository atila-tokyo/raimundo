Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :reminders
  resources :chatrooms, only: %i[show] do
    resources :messages, only: %i[create]
  end
end
