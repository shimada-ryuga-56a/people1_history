require 'test_helper'

class LikesOnInformationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post information_likes_on_informations_url(information_id: 1)
    assert_response :success
  end

  test 'should get destroy' do
    delete information_likes_on_informations_url(information_id: 1)
    assert_response :success
  end
end
