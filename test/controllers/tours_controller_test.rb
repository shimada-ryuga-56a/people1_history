require 'test_helper'

class ToursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @tour = create(:tour)
    p @tour
  end

  test 'should get show' do
    get tour_url(id: 1)
    assert_response :success
  end
end
