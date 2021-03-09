require "test_helper"

class PhotoAlbumControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photo_album_index_url
    assert_response :success
  end
end
