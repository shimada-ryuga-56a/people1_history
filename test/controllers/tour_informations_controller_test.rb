require 'test_helper'

class TourInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @tour = create(:tour)
  end

  test 'should get create' do
    post "#{tour_tour_informations_url(tour_id: @tour.id)}.turbo_stream", params: {
      tour_information: {
        body: 'Sample body text'
      }
    }
    assert_response :success
  end
end
