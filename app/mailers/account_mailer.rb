class AccountMailer < ApplicationMailer
  default from: "no-reply@bank.com"

  def welcome_email(bank_account)
    @bank_account = bank_account
    mail(to: @bank_account.email, subject: "Welcome to Our Bank")
  end
end
