require 'test_helper'

class SetlistitemInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    sign_in @user
    @event = create(:event)
    @setlist = create(:setlist)
    @setlistitem = create(:setlistitem)
  end

  test 'should get create' do
    post "#{setlistitem_informations_url(setlistitem_id: @setlistitem.id)}.turbo_stream", params: {
      setlistitem_information: {
        body: 'Sample body text',
        user_id: @user.id,
        setlistitem_id: @setlistitem.id
      }
    }
    assert_response :success
  end
end
