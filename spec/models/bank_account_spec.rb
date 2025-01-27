require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  it "is valid with valid attributes" do
    bank_account = build(:bank_account)
    expect(bank_account).to be_valid
  end

  it "is not valid without a name" do
    bank_account = build(:bank_account, name: nil)
    expect(bank_account).not_to be_valid
  end

  it "is not valid without an email" do
    bank_account = build(:bank_account, email: nil)
    expect(bank_account).not_to be_valid
  end

  it "is not valid with an invalid email" do
    bank_account = build(:bank_account, email: "invalid_email")
    expect(bank_account).not_to be_valid
  end

  it "is not valid without a pin" do
    bank_account = build(:bank_account, pin: nil)
    expect(bank_account).not_to be_valid
  end

  it "is not valid with a pin that is not 4 digits" do
    bank_account = build(:bank_account, pin: "123")
    expect(bank_account).not_to be_valid
  end

  it "is not valid with a non-numeric pin" do
    bank_account = build(:bank_account, pin: "abcd")
    expect(bank_account).not_to be_valid
  end

  it "is valid with a VIP account type" do
    vip_account = build(:bank_account, :vip)
    expect(vip_account).to be_valid
    expect(vip_account.account_type).to eq("vip")
  end

  it "generates a unique account_id before creation" do
    bank_account = create(:bank_account)
    expect(bank_account.account_id).not_to be_nil
  end

  it "has many source transactions" do
    bank_account = create(:bank_account)
    transaction = create(:bank_transaction, source_account: bank_account)
    expect(bank_account.source_transactions).to include(transaction)
  end

  it "has many destination transactions" do
    bank_account = create(:bank_account)
    transaction = create(:bank_transaction, destination_account: bank_account)
    expect(bank_account.destination_transactions).to include(transaction)
  end
end
