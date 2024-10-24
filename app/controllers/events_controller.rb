class EventsController < ApplicationController
  def index
    @events = Event.category(params[:category]).order(date: :desc)
    @categories = params[:category]
  end

  def show
    @event = Event.includes(:setlist).find(params[:id])
  end
end
