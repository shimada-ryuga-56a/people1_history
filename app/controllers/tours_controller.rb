class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.includes(link_contents: :link).find(params[:id])
    @link_contents = @tour.link_contents
    @tours = Event.where(tour_id: params[:id])
    @new_info = TourInformation.new
    @informations = TourInformation.where(tour_id: params[:id]).order(created_at: :desc)
  end
end
