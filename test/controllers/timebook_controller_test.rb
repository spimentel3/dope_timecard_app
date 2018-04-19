require 'test_helper'

class TimebookControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get timebook_new_url
    assert_response :success
  end

  test "should get show" do
    get timebook_show_url
    assert_response :success
  end

  test "should get create" do
    get timebook_create_url
    assert_response :success
  end

  test "should get update" do
    get timebook_update_url
    assert_response :success
  end

  test "should get edit" do
    get timebook_edit_url
    assert_response :success
  end

end
