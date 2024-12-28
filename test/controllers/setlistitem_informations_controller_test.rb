require 'test_helper'

class SetlistitemInformationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    post setlistitem_informations_url
    assert_response :success
  end
end
