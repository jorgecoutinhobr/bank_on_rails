class HomeController < ApplicationController
  def index; end

  def statement
    query = BankTransaction.by_account(current_account)

    @pagy, @transactions = pagy(query, items: 10)
  end
end
