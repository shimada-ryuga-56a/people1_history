class EventsController < ApplicationController
  def index
    @events = Event.category(params[:category]).order(date: :desc)
    @categories = params[:category]
    if params[:date] && params[:date].include?("1")
      @events = @events
    else
      @events = @events.where(date: ..Date.today)
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
