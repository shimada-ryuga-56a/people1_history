require 'test_helper'

class NoticesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get create' do
    get notices_url
    assert_response :success
  end

  test 'should get destroy' do
    delete notices_url
    assert_response :success
  end
end
