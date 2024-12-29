require 'test_helper'

class SongInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @song = create(:song)
  end

  test 'should get create' do
    post song_song_informations_url(song_id: @song.id), params: {
      song_information: {
        body: 'Sample body text'
      }
    }
    assert_response :success
  end
end
