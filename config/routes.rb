Rails.application.routes.draw do
  root "home#index"

  resources :bank_accounts, only: %i[new create] do
    resources :bank_transactions, only: %i[new create]
  end

  resources :sessions, only: %i[new create destroy]
end
