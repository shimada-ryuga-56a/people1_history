require 'test_helper'

class LikesOnTourInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @tour = create(:tour)
    @tour_information = create(:tour_information)
  end

  test 'should get create' do
    post tour_information_likes_on_tour_informations_url(tour_information_id: 1).turbo_stream.to_s
    assert_response :success
  end

  test 'should get destroy' do
    post tour_information_likes_on_tour_informations_url(tour_information_id: 1).turbo_stream.to_s
    delete tour_information_likes_on_tour_informations_url(tour_information_id: 1).turbo_stream.to_s
    assert_response :success
  end
end
