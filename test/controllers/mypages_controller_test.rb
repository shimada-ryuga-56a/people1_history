require 'test_helper'

class MypagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get show' do
    get mypage_url
    assert_response :success
  end
end
