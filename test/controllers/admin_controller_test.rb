require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get user_accesses" do
    get admin_user_accesses_url
    assert_response :success
  end
end
