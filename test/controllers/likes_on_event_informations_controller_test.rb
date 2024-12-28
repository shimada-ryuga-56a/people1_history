require 'test_helper'

class LikesOnEventInformationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post event_information_likes_on_event_informations_url(event_information_id: 1)
    assert_response :success
  end

  test 'should get destroy' do
    delete event_information_likes_on_event_informations_url(event_information_id: 1)
    assert_response :success
  end
end
