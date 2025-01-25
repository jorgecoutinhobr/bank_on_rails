class CreateBankTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :bank_transactions do |t|
      t.integer :transaction_type, null: false
      t.decimal :amount, null: false
      t.integer :source_account_id, null: false
      t.integer :destination_account_id

      t.timestamps
    end
  end
end
