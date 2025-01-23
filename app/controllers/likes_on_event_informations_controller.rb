class LikesOnEventInformationsController < ApplicationController
  def create
    event_information = EventInformation.find(params[:event_information_id])
    likes_on_event_information = current_user.likes_on_event_informations.new(event_information_id: event_information.id)
    likes_on_event_information.save
    respond_to do |format|
      format.turbo_stream { render 'event_informations/like', locals: { event_information: event_information } }
    end
  end

  def destroy
    event_information = EventInformation.find(params[:event_information_id])
    likes_on_event_information = current_user.likes_on_event_informations.find_by(event_information_id: event_information.id)
    likes_on_event_information.destroy
    respond_to do |format|
      format.turbo_stream { render 'event_informations/unlike', locals: { event_information: event_information } }
    end
  end
end
