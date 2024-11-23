class SetlistitemInformationsController < ApplicationController
  def create
    @info = SetlistitemInformation.new(setlistitem_information_params)
    respond_to do |format|
      if @info.save
        @setlistitem_new_info = SetlistitemInformation.new
        @item = Setlistitem.find(@info.setlistitem_id)
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream
      else
        @event = Event.find(@info.setlistitem.setlist.event.id)
        @event_infomations = EventInformation.where(event_id: @event.id).order(created_at: 'DESC')
        @setlistitems = Setlistitem.where(setlist_id: @event.setlist.id)
        @infos = []
        @setlistitems.each do |item|
          @infos << SetlistitemInformation.where(setlistitem_id: item.id)
        end
        @infos.flatten!
        format.html { render 'events/show', status: :unprocessable_entity }
      end
    end
  end

  private

  def setlistitem_information_params
    params.require(:setlistitem_information).permit(:body, :setlistitem_id).merge(user_id: current_user.id)
  end
end
