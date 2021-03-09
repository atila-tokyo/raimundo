require "test_helper"

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get guests_destroy_url
    assert_response :success
  end
end
