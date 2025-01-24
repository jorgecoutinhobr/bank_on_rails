class BankAccountsController < ApplicationController
  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      redirect_to root_path, notice: "Conta criada com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bank_account_params
    params.require(:bank_account).permit(:name, :pin, :pin_confirmation)
  end
end
