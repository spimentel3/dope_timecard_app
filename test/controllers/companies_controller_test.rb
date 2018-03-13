require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:John)
  end

  test "should redirect create when not logged in" do
    get create_company_path
    assert_redirected_to login_url
  end

  test "should get new" do
    log_in_as(@user)
    get create_company_path
    assert_response :success
  end

end
