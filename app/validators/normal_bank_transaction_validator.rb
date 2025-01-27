class NormalBankTransactionValidator < ActiveModel::Validator
  def validate(record)
    validations = [
      { condition: (record.withdrawal_or_transfer? && record.source_account.balance < record.amount),
        message: "Insufficient balance"
      },

      { condition: (record.transfer? && record.amount > 1000),
        message: "Transfer limit exceeded"
      },

      { condition: (record.transfer? && record.source_account == record.destination_account),
        message: "Cant't transfer it to yourself"
      },

      { condition: (record.transfer? && record.destination_account.nil?),
        message: "Destination account not found"
      },

      { condition: record.manager_visit?,
        message: "You need to be VIP to do that" }
    ]

    validations.each do |validation|
      if validation[:condition]
        record.errors.add(:base, message: validation[:message])
      end
    end
  end
end
