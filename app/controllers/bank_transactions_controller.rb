class BankTransactionsController < ApplicationController
  before_action :set_bank_account
  before_action :account_not_authorized

  def new
    @bank_transaction = @bank_account.source_transactions.new
  end

  def create
    @bank_transaction = @bank_account.source_transactions.new(transaction_params)
    destination_account = BankAccount.find_by(account_id: transaction_params[:destination_account_id])
    @bank_transaction.destination_account = destination_account

    if @bank_transaction.save
      redirect_to root_path, notice: "Transaction was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def manager_visit
    @bank_transaction = @bank_account.source_transactions.new(transaction_type: :manager_visit, amount: 50)

    if @bank_transaction.save
      redirect_to root_path, notice: "Manager visit was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_bank_account
    @bank_account = BankAccount.find(params[:bank_account_id])
  end

  def transaction_params
    params.require(:bank_transaction).permit(:destination_account_id, :amount, :transaction_type)
  end

  def account_not_authorized
    return if @bank_account == current_account

    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end
end
