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
    @youtube_contents = @event.links.where(platform: "YouTube").or(@event.links.where(platform: "YouTubeMusic"))
    @tiktok_contents = @event.links.where(platform: "TikTok")
    @disc_contents = DiscContent.includes(:event, disc_version: :disc).where(event_id: params[:id])
    @info = EventInformation.new
    @event_infomations = EventInformation.includes([:user, :likes_on_event_informations])
                                         .where(event_id: params[:id]).order(created_at: :desc)
    return unless @event.setlist

    @setlistitems = Setlistitem.where(setlist_id: @event.setlist.id)
    @infos = []
    @setlistitems.each do |item|
      @infos << SetlistitemInformation.where(setlistitem_id: item.id).order(created_at: :desc)
    end
    @infos.flatten!
    @setlistitem_new_info = SetlistitemInformation.new
  end

  def image
    @event = Event.includes(visual_image_attachment: :blob).find(params[:id])
  end
end
