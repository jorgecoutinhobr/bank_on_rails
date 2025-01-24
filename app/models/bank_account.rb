class BankAccount < ApplicationRecord
  has_secure_password :pin, validations: true
end
