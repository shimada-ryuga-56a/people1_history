class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @tours = Event.where(tour_id: params[:id])
  end
end
