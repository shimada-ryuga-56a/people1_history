require 'test_helper'

class NoticesControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get notices_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get notices_destroy_url
    assert_response :success
  end
end
