class CreateBankAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :bank_accounts do |t|
      t.string :name, null: false
      t.string :pin_digest
      t.string :pin_confirmation
      t.decimal :balance, default: 0.0
      t.string :account_id

      t.timestamps
    end
    add_index :bank_accounts, :account_id, unique: true
  end
end
