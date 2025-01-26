class ApplicationController < ActionController::Base
  include Pagy::Backend
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  before_action :require_login

  helper_method :current_account

  def current_account
    @current_account ||= session[:bank_account_id] && BankAccount.find_by(id: session[:bank_account_id])
  end

  def account_signed_in?
    current_account.present?
  end

  def require_login
    return if account_signed_in?

    flash[:alert] = "You must be signed in to access this section"
    redirect_to new_session_path
  end
end
