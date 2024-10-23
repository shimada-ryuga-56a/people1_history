class EventsController < ApplicationController
  def index
    @events = Event.all.order(date: "ASC")
  end

  def show
  end
end
