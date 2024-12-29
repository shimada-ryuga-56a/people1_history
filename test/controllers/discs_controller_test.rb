require 'test_helper'

class DiscsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @disc = create(:disc)
  end

  test 'should get show' do
    get disc_url(id: 1)
    assert_response :success
  end
end
