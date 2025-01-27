Rails.application.routes.draw do
  root "home#index"

  resources :bank_accounts, only: %i[new create] do
    member do
      get :statement
    end

    resources :bank_transactions, only: %i[new create] do
      collection do
        post :manager_visit
      end
    end
  end

  resources :sessions, only: %i[new create destroy]
end
