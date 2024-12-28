require 'test_helper'

class SetlistitemInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get create' do
    post setlistitem_informations_url
    assert_response :success
  end
end
