class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.find_by(account_id: params[:bank_account][:account_id])

    if @bank_account && @bank_account.authenticate_pin(params[:bank_account][:pin])
      session[:bank_account_id] = @bank_account.id
      redirect_to root_path
    else
      flash[:alert] = "Invalid account ID/PIN combination"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:bank_account_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to root_path
  end
end
