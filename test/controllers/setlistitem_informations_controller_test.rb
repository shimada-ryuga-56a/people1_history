require "test_helper"

class SetlistitemInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get setlistitem_informations_create_url
    assert_response :success
  end
end
