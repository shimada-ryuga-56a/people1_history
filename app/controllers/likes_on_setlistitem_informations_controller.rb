class LikesOnSetlistitemInformationsController < ApplicationController
  def create
    setlistitem_information = SetlistitemInformation.find(params[:setlistitem_information_id])
    likes_on_setlistitem_information = current_user.likes_on_setlistitem_informations.new(setlistitem_information_id: setlistitem_information.id)
    likes_on_setlistitem_information.save
    redirect_to event_path(id: setlistitem_information.setlistitem.setlist.event.id)
  end

  def destroy
    setlistitem_information = SetlistitemInformation.find(params[:setlistitem_information_id])
    likes_on_setlistitem_information = current_user.likes_on_setlistitem_informations.find_by(setlistitem_information_id: setlistitem_information.id)
    likes_on_setlistitem_information.destroy
    redirect_to event_path(id: setlistitem_information.setlistitem.setlist.event.id)
  end
end
