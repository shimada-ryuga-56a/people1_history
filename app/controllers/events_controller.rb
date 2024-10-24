class EventsController < ApplicationController
  def index
    @events = Event.category(params[:category]).order(date: :desc)
    @categories = params[:category]
  end

  def show
  end
end
