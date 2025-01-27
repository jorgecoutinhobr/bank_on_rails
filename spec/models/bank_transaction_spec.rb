require 'rails_helper'

RSpec.describe BankTransaction, type: :model do
  it "is valid with valid attributes" do
    bank_transaction = build(:bank_transaction)
    expect(bank_transaction).to be_valid
  end

  it "is not valid without an amount" do
    bank_transaction = build(:bank_transaction, amount: nil)
    expect(bank_transaction).not_to be_valid
  end

  it "is not valid with a non-numeric amount" do
    bank_transaction = build(:bank_transaction, amount: "abc")
    expect(bank_transaction).not_to be_valid
  end

  it "is not valid with a negative amount" do
    bank_transaction = build(:bank_transaction, amount: -100)
    expect(bank_transaction).not_to be_valid
  end

  it "is valid with a withdrawal transaction type" do
    bank_transaction = build(:bank_transaction, :withdrawal)
    expect(bank_transaction).to be_valid
    expect(bank_transaction.transaction_type).to eq("withdrawal")
  end

  it "is valid with a transfer transaction type" do
    bank_transaction = build(:bank_transaction, :transfer)
    expect(bank_transaction).to be_valid
    expect(bank_transaction.transaction_type).to eq("transfer")
  end

  it "is valid with a manager visit transaction type" do
    bank_transaction = build(:bank_transaction, :manager_visit)
    expect(bank_transaction).to be_valid
    expect(bank_transaction.transaction_type).to eq("manager_visit")
  end

  it "belongs to a source account" do
    bank_transaction = build(:bank_transaction)
    expect(bank_transaction.source_account).to be_present
  end

  it "can belong to a destination account" do
    bank_transaction = build(:bank_transaction, :transfer)
    expect(bank_transaction.destination_account).to be_present
  end

  it "calculates the total amount for the sender correctly" do
    bank_transaction = build(:bank_transaction, amount: 100, bank_fee: 10)
    expect(bank_transaction.total_amount(bank_transaction.source_account).to_f).to eq(110)
  end

  it "calculates the total amount for the receiver correctly" do
    bank_transaction = build(:bank_transaction, amount: 100)
    expect(bank_transaction.total_amount(bank_transaction.destination_account).to_f).to eq(100)
  end
end
