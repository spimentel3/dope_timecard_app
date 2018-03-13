require 'test_helper'

class CompaniesCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:John)
  end

  test "valid company information" do
    log_in_as(@user)
    get create_company_url
    assert_difference 'Company.count' do
      post create_company_url, params: { company: { owner: @user.name, name: "Test Company" }}
    end
  end

  test "invalid company information" do
    log_in_as(@user)
    get create_company_url
    assert_no_difference 'Company.count' do
      post create_company_path, params: { company: { owner: @user.id, name: "" }}
    end
    assert_template 'companies/new'
    assert_no_difference 'Company.count' do
      post create_company_path, params: { company: { owner: "", name: "Sean" }}
    end
    assert_template 'companies/new'
  end

end
