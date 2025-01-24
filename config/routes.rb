Rails.application.routes.draw do
  root "home#index"

  resources :bank_accounts, only: %i[new create]
end
