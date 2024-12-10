class EventBookmarksController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    event_bookmark = current_user.event_bookmarks.new(event_id: event.id)
    event_bookmarks.save
    redirect_to event_path(id: event.id)
  end

  def destroy
    event = Event.find(params[:event_id])
    event_bookmark = current_user.event_bookmarks.find_by(event_id: event.id)
    event_bookmark.destroy
    redirect_to event_path(id: event.id)
  end
end
