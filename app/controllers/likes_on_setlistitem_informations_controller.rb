class LikesOnSetlistitemInformationsController < ApplicationController
  def create
    setlistitem_information = SetlistitemInformation.find(params[:setlistitem_information_id])
    likes_on_setlistitem_information =
      current_user.likes_on_setlistitem_informations.new(setlistitem_information_id: setlistitem_information.id)
    likes_on_setlistitem_information.save
    respond_to do |format|
      format.turbo_stream { render 'setlistitem_informations/like', locals: { setlistitem_info: setlistitem_information } }
    end
  end

  def destroy
    setlistitem_information = SetlistitemInformation.find(params[:setlistitem_information_id])
    likes_on_setlistitem_information =
      current_user.likes_on_setlistitem_informations.find_by(setlistitem_information_id: setlistitem_information.id)
    likes_on_setlistitem_information.destroy
    respond_to do |format|
      format.turbo_stream { render 'setlistitem_informations/like', locals: { setlistitem_info: setlistitem_information } }
    end
  end
end
