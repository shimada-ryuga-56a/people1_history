require "test_helper"

class TourInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get tour_informations_create_url
    assert_response :success
  end
end
