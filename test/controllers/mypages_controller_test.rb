require 'test_helper'

class MypagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    setup do
      @user = users(:one)
      sign_in @user
    end

    get mypage_url
    assert_response :success
  end
end
