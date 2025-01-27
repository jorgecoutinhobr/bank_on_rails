class BankAccount < ApplicationRecord
  has_secure_password :pin, validations: true

  before_create :generate_account_id

  enum :account_type, [ :normal, :vip ]

  has_many :source_transactions, class_name: "BankTransaction", foreign_key: "source_account_id", dependent: :destroy
  has_many :destination_transactions, class_name: "BankTransaction", foreign_key: "destination_account_id", dependent: :destroy

  validates :pin, format: { with: /\A\d{4}\z/, message: "must be exactly 4 numeric digits" }, on: :create
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def transfer_receiver?(transaction)
    transaction.destination_account_id == id
  end

  def transfer_sender?(transaction)
    transaction.source_account_id == id
  end

  private

  def generate_account_id
    loop do
      self.account_id = rand(10**5).to_s.rjust(5, "0")
      break account_id unless BankAccount.exists?(account_id: account_id)
    end
  end
end
