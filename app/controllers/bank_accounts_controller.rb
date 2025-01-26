class BankAccountsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      redirect_to root_path, notice: "Bank account was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def statement
    query = BankTransaction.where("source_account_id = ? OR destination_account_id = ?", current_account.id, current_account.id)
    @pagy, @transactions = pagy(query, items: 10)
  end

  private

  def bank_account_params
    params.require(:bank_account).permit(:name, :pin, :pin_confirmation)
  end
end
