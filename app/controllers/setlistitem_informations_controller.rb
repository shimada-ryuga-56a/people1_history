class SetlistitemInformationsController < ApplicationController
  def create
    @new_info = SetlistitemInformation.new(setlistitem_information_params)
    if @new_info.save
      redirect_to event_path(@new_info.setlistitem.setlist.event.id)
    else
      redirect_to event_path(@new_info.setlistitem.setlist.event.id), status: :unprocessable_entity
    end
  end

  private

  def setlistitem_information_params
    params.require(:setlistitem_information).permit(:body, :setlistitem_id).merge(user_id: current_user.id)
  end
end
