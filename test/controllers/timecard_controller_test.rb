require 'test_helper'

class TimecardControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get timecard_new_url
    assert_response :success
  end

  test "should get show" do
    get timecard_show_url
    assert_response :success
  end

  test "should get create" do
    get timecard_create_url
    assert_response :success
  end

  test "should get update" do
    get timecard_update_url
    assert_response :success
  end

  test "should get edit" do
    get timecard_edit_url
    assert_response :success
  end

end
