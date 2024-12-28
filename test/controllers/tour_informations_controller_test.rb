require 'test_helper'

class TourInformationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post tour_tour_informations_url(tour_id: 1)
    assert_response :success
  end
end
