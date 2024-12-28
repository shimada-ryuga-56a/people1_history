require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get tour_url(id: 1)
    assert_response :success
  end
end
