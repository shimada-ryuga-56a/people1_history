class SetlistitemInformationsController < ApplicationController
  def create
    @new_info = SetlistitemInformation.new(setlistitem_information_params)
    if @new_info.save
      redirect_to event_path(@new_info.setlistitem.setlist.event.id)
    else
      @event = Event.find(@new_info.setlistitem.setlist.event.id)
      @setlistitems = Setlistitem.where(setlist_id: @event.setlist.id)
      @infos = []
      @setlistitems.each do |item|
        @infos << SetlistitemInformation.where(setlistitem_id: item.id)
      end
      @infos.flatten!
      render 'events/show', status: :unprocessable_entity
    end
  end

  private

  def setlistitem_information_params
    params.require(:setlistitem_information).permit(:body, :setlistitem_id).merge(user_id: current_user.id)
  end
end
