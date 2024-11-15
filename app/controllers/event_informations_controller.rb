class EventInformationsController < ApplicationController
  def create
    @info = EventInformation.new(event_information_params)
    if @info.save
      redirect_to event_path(id: params[:event_id])
    else
      @event = Event.includes(:setlist).find(params[:id])
      return unless @event.setlist
  
      @setlistitems = Setlistitem.where(setlist_id: @event.setlist.id)
      @infos = []
      @setlistitems.each do |item|
        @infos << SetlistitemInformation.where(setlistitem_id: item.id)
      end
      @infos.flatten!
  
      @event_infos = EventInformation.where(event_id: params[:id])
      render 'events/show', status: :unprocessable_entity
    end
  end

  private

  def event_information_params
    params.require(:event_information).permit(:body).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
