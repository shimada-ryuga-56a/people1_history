require 'test_helper'

class SetlistitemInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @event = create(:event)
    @setlist = create(:setlist)
    @setlistitem = create(:setlistitem)
  end

  test 'should get create' do
    post "#{setlistitem_informations_url(setlistitem: @setlistitem.id)}.turbo_stream", params: {
      song_information: {
        body: 'Sample body text'
      }
    }
    assert_response :success
  end
end
