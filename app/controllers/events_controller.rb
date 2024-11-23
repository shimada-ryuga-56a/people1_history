class EventsController < ApplicationController
  def index
    @events = Event.category(params[:category]).order(date: :desc)
    @categories = params[:category]
    @events = if params[:date]&.include?('1')
                @events.page(params[:page])
              else
                @events.where(date: ..Time.zone.today).page(params[:page])
              end
    respond_to do |format|
      format.html {"events/index"}
      format.turbo_stream
    end
  end

  def show
    @event = Event.includes(:setlist).find(params[:id])
    @info = EventInformation.new
    @event_infomations = EventInformation.where(event_id: params[:id]).order(created_at: 'DESC')
    return unless @event.setlist

    @setlistitems = Setlistitem.where(setlist_id: @event.setlist.id)
    @infos = []
    @setlistitems.each do |item|
      @infos << SetlistitemInformation.where(setlistitem_id: item.id).order(created_at: 'DESC')
    end
    @infos.flatten!
    @setlistitem_new_info = SetlistitemInformation.new
  end
  respond_to do |format|
    format.html {"events/show"}
  end
end
