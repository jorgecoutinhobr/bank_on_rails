puts "Creating BankAccounts and BankTransactions..."

BankAccount.create!(name: "Jorge", balance: 100000, pin: "1234", pin_confirmation: "1234", email: 'jorge@com')
BankAccount.create!(name: "Marcelo", balance: 100000, pin: "1234", pin_confirmation: "1234", account_type: :vip, email: 'marcelo@com')

a = BankAccount.first
b = BankAccount.last
a.update!(account_id: '12345')
b.update!(account_id: '54321')

options = [ :deposit, :withdrawal ]
values = [ 100, 500, 777, 1000 ]

7.times do
  BankTransaction.create!(amount: values.sample, transaction_type: options.sample, source_account: a)
  BankTransaction.create!(amount: values.sample, transaction_type: :transfer, source_account: a, destination_account: b)
end

3.times do
  BankTransaction.create!(amount: values.sample, transaction_type: options.sample, source_account: b)
  BankTransaction.create!(amount: values.sample, transaction_type: :transfer, source_account: b, destination_account: a)
end

BankTransaction.create!(amount: 50, transaction_type: :manager_visit, source_account: b)

puts "BankAccounts and BankTransactions created!"
