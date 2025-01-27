BankAccount.create!(name: "Jorge", balance: 10000, pin: "1234", pin_confirmation: "1234", email: 'jorge@com')
BankAccount.create!(name: "Marcelo", balance: 10000, pin: "1234", pin_confirmation: "1234", account_type: :vip, email: 'marcelo@com')

a = BankAccount.first
b = BankAccount.last

options = [ :deposit, :withdrawal ]

7.times do
  BankTransaction.create!(amount: 100, transaction_type: options.sample, source_account: a)
  BankTransaction.create!(amount: 100, transaction_type: :transfer, source_account: a, destination_account: b)
end
