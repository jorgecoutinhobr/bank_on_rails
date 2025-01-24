class BankAccount < ApplicationRecord
  has_secure_password :pin, validations: true

  before_create :generate_account_id

  enum :account_type, [ :normal, :vip ]

  private

  def generate_account_id
    loop do
      self.account_id = rand(10**5).to_s.rjust(5, "0")
      break account_id unless BankAccount.exists?(account_id: account_id)
    end
  end
end
