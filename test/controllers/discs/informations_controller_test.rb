require 'test_helper'

class Discs::InformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should get create' do
    post disc_informations_url(disc_id: 1)
    assert_response :success
  end
end
