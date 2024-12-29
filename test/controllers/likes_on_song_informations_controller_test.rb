require 'test_helper'

class LikesOnSongInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @song = create(:song)
  end

  test 'should get create' do
    post song_information_likes_on_song_informations_url(song_information_id: 1)
    assert_response :success
  end

  test 'should get destroy' do
    @user = create(:user)
    @song_information = create(:song_information)
    delete song_information_likes_on_song_informations_url(song_information_id: 1)
    assert_response :success
  end
end
