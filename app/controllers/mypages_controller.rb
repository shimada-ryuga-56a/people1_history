class MypagesController < ApplicationController
  def show
    @events = current_user.bookmark_events.order(date: :desc)
  end
end
