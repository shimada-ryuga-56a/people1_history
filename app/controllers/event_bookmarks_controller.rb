class EventBookmarksController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    event_bookmark = current_user.event_bookmarks.new(event_id: @event.id)
    event_bookmark.save
    respond_to do |format|
      format.turbo_stream { render 'events/bookmark', locals: { event: @event } }
    end
  end

  def destroy
    event_bookmark = current_user.event_bookmarks.find(params[:id])
    event_bookmark.destroy
    respond_to do |format|
      format.turbo_stream { render 'events/bookmark', locals: { event: Event.find(event_bookmark.event.id) } }
    end
  end
end
