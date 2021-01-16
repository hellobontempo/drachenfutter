require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get NEW" do
    get users_NEW_url
    assert_response :success
  end

  test "should get CREATE" do
    get users_CREATE_url
    assert_response :success
  end

  test "should get SHOW" do
    get users_SHOW_url
    assert_response :success
  end
end
