require "test_helper"

class LikesOnInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get likes_on_informations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get likes_on_informations_destroy_url
    assert_response :success
  end
end
