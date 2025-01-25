class BankTransaction < ApplicationRecord
  belongs_to :source_account, class_name: "BankAccount", validate: false
  belongs_to :destination_account, class_name: "BankAccount", optional: true, validate: false

  enum :transaction_type, [ :withdrawal, :deposit, :transfer ]

  validates :amount, numericality: { greater_than: 0 }

  validates_with NormalBankTransactionValidator, if: -> { source_account.normal? }
  validates_with VipBankTransactionValidator, if: -> { source_account.vip? }

  before_commit :process_transaction

  def withdrawal_or_transfer?
    withdrawal? || transfer?
  end

  private

  def process_transaction
    BankTransaction.transaction do
      if withdrawal?
        source_account.update!(balance: source_account.balance - amount)
      elsif deposit?
        source_account.update!(balance: source_account.balance + amount)
      elsif transfer?
        source_account.update!(balance: source_account.balance - amount)
        destination_account.update!(balance: destination_account.balance + amount)
      end
    end
  end
end
