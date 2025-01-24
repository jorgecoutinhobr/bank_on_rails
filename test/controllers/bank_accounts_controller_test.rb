require "test_helper"

class BankAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bank_accounts_new_url
    assert_response :success
  end

  test "should get create" do
    get bank_accounts_create_url
    assert_response :success
  end
end
