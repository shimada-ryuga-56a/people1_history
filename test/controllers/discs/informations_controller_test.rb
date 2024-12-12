require 'test_helper'

class Discs::InformationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get discs_informations_create_url
    assert_response :success
  end
end
