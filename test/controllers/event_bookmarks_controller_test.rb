require 'test_helper'

class EventBookmarksControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get event_bookmarks_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get event_bookmarks_destroy_url
    assert_response :success
  end
end
