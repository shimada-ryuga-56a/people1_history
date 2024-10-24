require "test_helper"

class SetlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get setlists_edit_url
    assert_response :success
  end
end
