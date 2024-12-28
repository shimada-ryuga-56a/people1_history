require 'test_helper'

class LikesOnTourInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get create' do
    post tour_information_likes_on_tour_informations_url(tour_information_id: 1)
    assert_response :success
  end

  test 'should get destroy' do
    delete tour_information_likes_on_tour_informations_url(tour_information_id: 1)
    assert_response :success
  end
end
