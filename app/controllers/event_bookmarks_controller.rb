class EventBookmarksController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    event_bookmark = current_user.event_bookmarks.new(event_id: event.id)
    event_bookmark.save
    redirect_to request.referer
  end

  def destroy
    event_bookmark = current_user.event_bookmarks.find(params[:id])
    event_bookmark.destroy
    redirect_to request.referer
  end
end
