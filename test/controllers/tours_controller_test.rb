require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get show' do
    p @user 
    get tour_url(id: 1)
    assert_response :success
  end
end
