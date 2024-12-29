require 'test_helper'

class EventBookmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @event = create(:event)
  end

  test 'should get create' do
    post event_event_bookmarks_url(event_id: 1)
    assert_response :success
  end

  test 'should get destroy' do
    @user = create(:user)
    @event_bookmark = create(:event_bookmark)
    delete event_event_bookmarks_url(event_id: 1)
    assert_response :success
  end
end
