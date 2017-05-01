require 'test_helper'

class RequestControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get request_create_url
    assert_response :success
  end

  test "should get new" do
    get request_new_url
    assert_response :success
  end

end
