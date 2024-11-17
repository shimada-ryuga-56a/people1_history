class LikesOnEventInformationsController < ApplicationController
  def create
    event_information = EventInformation.find(params[:event_information_id])
    likes_on_event_information = current_user.likes_on_event_informations.new(event_information_id: event_information.id)
    likes_on_event_information.save
    likes_on_event_information.create_notice(event_information.user)
    redirect_to event_path(id: event_information.event.id)
  end

  def destroy
    event_information = EventInformation.find(params[:event_information_id])
    likes_on_event_information = current_user.likes_on_event_informations.find_by(event_information_id: event_information.id)
    likes_on_event_information.destroy
    redirect_to event_path(id: event_information.event.id)
  end
end
