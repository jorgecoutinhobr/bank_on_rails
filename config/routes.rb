Rails.application.routes.draw do
  root "home#index"
  get "statement", to: "home#statement"

  resources :bank_accounts, only: %i[new create] do

    resources :bank_transactions, only: %i[new create] do
      collection do
        post :manager_visit
      end
    end

  end

  resources :sessions, only: %i[new create destroy]
end
