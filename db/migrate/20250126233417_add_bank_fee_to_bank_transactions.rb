class AddBankFeeToBankTransactions < ActiveRecord::Migration[8.0]
  def change
    add_column :bank_transactions, :bank_fee, :decimal
  end
end
