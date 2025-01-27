class VipBankTransactionValidator < ActiveModel::Validator
  def validate(record)
    if record.transfer? && record.destination_account.nil?
      record.errors.add(:base, message: "Destination account not found")
    end

    if record.transfer? && record.destination_account_id == record.source_account_id
      record.errors.add(:base, message: "Cant't transfer it to yourself")
    end
  end
end
