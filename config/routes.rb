Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :reminders, only: %i[index new create]
end
