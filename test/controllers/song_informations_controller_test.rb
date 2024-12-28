require 'test_helper'

class SongInformationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post song_song_informations_url(song_id: 1)
    assert_response :success
  end
end
