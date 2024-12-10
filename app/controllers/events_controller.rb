class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show image]

  def index
    @categories = Event.categories
    @q = Event.includes(event_bookmarks: :user).ransack(params[:q])
    @events = if params[:q].present?
                @q.result(distinct: true).order(date: :desc).page(params[:page])
              else
                Event.past.order(date: :desc).page(params[:page])
              end
  end

  def show
    @event = Event.includes(:setlist).find(params[:id])
    @disc_contents = DiscContent.includes(:event, disc_version: :disc).where(event_id: params[:id])
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
    format.html { 'events/show' }
  end

  def image
    @event = Event.includes(visual_image_attachment: :blob).find(params[:id])
  end
end
