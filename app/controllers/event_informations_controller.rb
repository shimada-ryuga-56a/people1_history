class EventInformationsController < ApplicationController
  def create
    @info = EventInformation.new(event_information_params)
    respond_to do |format|
      if @info.save
        @new_info = EventInformation.new
        @event = Event.find(params[:event_id])
        # flash[:success] = I18n.t('flash.success.post')
        format.turbo_stream
      else
        @event = Event.includes(:setlist).find(params[:event_id])
        @event_infomations = EventInformation.where(event_id: params[:event_id]).order(created_at: 'DESC')
        return unless @event.setlist

        @setlistitems = Setlistitem.where(setlist_id: @event.setlist.id)
        @infos = []
        @setlistitems.each do |item|
          @infos << SetlistitemInformation.where(setlistitem_id: item.id)
        end
        @infos.flatten!
        flash.now[:error] = I18n.t('flash.error.post')
        format.html { render 'events/show', status: :unprocessable_entity }
      end
    end
  end

  private

  def event_information_params
    params.require(:event_information).permit(:body).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
