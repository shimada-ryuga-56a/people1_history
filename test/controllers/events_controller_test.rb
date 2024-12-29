require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @event = create(:event)
  end

  test 'should get index' do
    get events_url
    assert_response :success
  end

  test 'should get show' do
    get event_url(id: 1)
    assert_response :success
  end
end
