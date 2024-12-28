require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get songs_url
    assert_response :success
  end

  test 'should get show' do
    get song_url(id: 1)
    assert_response :success
  end
end
