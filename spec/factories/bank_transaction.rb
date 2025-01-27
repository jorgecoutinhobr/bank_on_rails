FactoryBot.define do
  factory :bank_transaction do
    amount { 100 }
    transaction_type { :deposit }
    association :source_account, factory: :bank_account
    association :destination_account, factory: :bank_account

    trait :withdrawal do
      transaction_type { :withdrawal }
    end

    trait :transfer do
      transaction_type { :transfer }
      association :destination_account, factory: :bank_account
    end

    trait :manager_visit do
      transaction_type { :manager_visit }
      association :source_account, factory: [:bank_account, :vip]
    end
  end
end
