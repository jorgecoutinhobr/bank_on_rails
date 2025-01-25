class VipBankTransactionValidator < ActiveModel::Validator
  def validate(record)
    if record.transfer? && record.destination_account.nil?
      record.errors.add(:base, message: "Destination account not found")
    end
  end
end
