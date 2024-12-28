require 'test_helper'

class LikesOnSetlistitemInformationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post setlistitem_information_likes_on_setlistitem_informations_url(setlistitem_information_id: 1)
    assert_response :success
  end

  test 'should get destroy' do
    delete setlistitem_information_likes_on_setlistitem_informations_url(setlistitem_information_id: 1)
    assert_response :success
  end
end
