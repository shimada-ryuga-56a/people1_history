require 'test_helper'

class EventBookmarksControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post event_event_bookmarks_url(event_id: 1)
    assert_response :success
  end

  test 'should get destroy' do
    delete event_event_bookmarks_url(event_id: 1)
    assert_response :success
  end
end
