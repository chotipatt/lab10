require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get main_login_url
    assert_response :success
  end

  test "should get user_item" do
    get main_user_item_url
    assert_response :success
  end

  test "should get inventories" do
    get main_inventories_url
    assert_response :success
  end
end
