require 'test_helper'

class SongInformationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get song_informations_create_url
    assert_response :success
  end
end
