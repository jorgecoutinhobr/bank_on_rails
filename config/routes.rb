Rails.application.routes.draw do
  root "home#index"

  resources :bank_accounts, only: %i[new create]
  resources :sessions, only: %i[new create destroy]
end
