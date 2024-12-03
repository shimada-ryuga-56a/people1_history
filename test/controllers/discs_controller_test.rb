require 'test_helper'

class DiscsControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get discs_show_url
    assert_response :success
  end
end
