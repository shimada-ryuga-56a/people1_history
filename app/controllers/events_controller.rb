class EventsController < ApplicationController
  def index
    @categories = Event.categories
    @q = Event.ransack(params[:q])
    if params[:q].present? && params[:q][:date_gteq] == "1"
      @events = @q.result(distinct: true).order(date: :desc).page(params[:page])
    elsif params[:q].present? && params[:q][:date_gteq] == "0"
      @events = @q.result(distinct: true).where("date <= ?", Date.today).order(date: :desc).page(params[:page])
    else
      @events = Event.where("date <= ?", Date.today).order(date: :desc).page(params[:page])
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
