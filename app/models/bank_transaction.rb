class BankTransaction < ApplicationRecord
  belongs_to :source_account, class_name: "BankAccount", validate: false
  belongs_to :destination_account, class_name: "BankAccount", optional: true, validate: false

  enum :transaction_type, [ :withdrawal, :deposit, :transfer, :manager_visit ]

  validates :amount, numericality: { greater_than: 0 }

  validates_with NormalBankTransactionValidator, if: -> { source_account.normal? }
  validates_with VipBankTransactionValidator, if: -> { source_account.vip? }

  before_save :set_fee, if: :transfer?
  before_commit :process_transaction

  scope :by_account, ->(account) { where("source_account_id = ? OR destination_account_id = ?",
                                    account.id, account.id).order(created_at: :desc)}

  def withdrawal_or_transfer?
    withdrawal? || transfer?
  end

  def total_amount(is_sender)
    return amount + (bank_fee || 0) if is_sender
    amount
  end

  private

  def process_transaction
    if withdrawal?
      source_account.update!(balance: source_account.balance - amount)
    elsif deposit?
      source_account.update!(balance: source_account.balance + amount)
    elsif transfer?
      source_account.update!(balance: source_account.balance - amount - bank_fee)
      destination_account.update!(balance: destination_account.balance + amount)
    elsif manager_visit?
      source_account.update!(balance: source_account.balance - amount)
    end
  end

  def set_fee
    fee = source_account.normal? ? 8 : amount * 0.008
    self.bank_fee = fee
  end
end
