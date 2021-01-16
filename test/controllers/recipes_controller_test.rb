require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get NEW" do
    get recipes_NEW_url
    assert_response :success
  end

  test "should get CREATE" do
    get recipes_CREATE_url
    assert_response :success
  end

  test "should get SHOW" do
    get recipes_SHOW_url
    assert_response :success
  end
end
