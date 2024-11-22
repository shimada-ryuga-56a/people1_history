class SetlistitemInformationsController < ApplicationController
  def create
    @info = SetlistitemInformation.new(setlistitem_information_params)
    respond_to do |format|
      if @info.save
        format.turbo_stream
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
  end

  private

  def setlistitem_information_params
    params.require(:setlistitem_information).permit(:body, :setlistitem_id).merge(user_id: current_user.id)
  end
end
