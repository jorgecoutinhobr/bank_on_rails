FactoryBot.define do
  factory :bank_account do
    name { "John Doe" }
    balance { 10000 }
    pin { "1234" }
    pin_confirmation { "1234" }
    email { Randamu::Account.email }
    account_type { :normal }

    trait :vip do
      account_type { :vip }
    end
  end
end
