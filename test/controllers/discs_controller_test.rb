require 'test_helper'

class DiscsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get disc_url(id: 1)
    assert_response :success
  end
end
