require 'test_helper'

class InformationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get informations_create_url
    assert_response :success
  end
end
