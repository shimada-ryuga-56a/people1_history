require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @song = create(:song)
  end

  test 'should get index' do
    get songs_url
    assert_response :success
  end

  test 'should get show' do
    get song_url(id: 1)
    assert_response :success
  end
end
