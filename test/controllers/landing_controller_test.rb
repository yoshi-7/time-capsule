require "test_helper"

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get landing_index_url
    assert_response :success
  end

  test "should get retrieve_capsule" do
    get landing_retrieve_capsule_url
    assert_response :success
  end
end
