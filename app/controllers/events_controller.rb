class EventsController < ApplicationController
  def index
    @events = Event.category(params[:category]).order(date: :desc)
    @categories = params[:category]
    @events = if params[:date]&.include?('1')
                @events
              else
                @events.where(date: ..Time.zone.today)
              end
  end

  def show
    @event = Event.includes(:setlist).find(params[:id])
    return unless @event.setlist

    @setlistitems = Setlistitem.where(setlist_id: @event.setlist.id)
    @infos = []
    @setlistitems.each do |item|
      @infos << SetlistitemInformation.where(setlistitem_id: item.id)
    end
    @infos.flatten!
  end
end
