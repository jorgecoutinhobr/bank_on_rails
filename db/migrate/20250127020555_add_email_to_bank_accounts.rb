class AddEmailToBankAccounts < ActiveRecord::Migration[8.0]
  def change
    add_column :bank_accounts, :email, :string, null: false
  end
end
