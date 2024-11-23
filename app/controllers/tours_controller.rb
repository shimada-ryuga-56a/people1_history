class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @tours = Event.where(tour_id: params[:id])
    @new_info = TourInformation.new
    @informations = TourInformation.where(tour_id: params[:id]).order(created_at: 'DESC')
  end
end
