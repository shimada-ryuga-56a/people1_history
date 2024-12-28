require 'test_helper'

class LikesOnSongInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get create' do
    post song_information_likes_on_song_informations_url(song_information_id: 1)
    assert_response :success
  end

  test 'should get destroy' do
    delete song_information_likes_on_song_informations_url(song_information_id: 1)
    assert_response :success
  end
end
