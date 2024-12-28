require 'test_helper'

class NoticesControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get notices
    assert_response :success
  end

  test 'should get destroy' do
    delete notices
    assert_response :success
  end
end
