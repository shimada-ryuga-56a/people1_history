class TourInformationsController < ApplicationController
  def create
    @info = TourInformation.new(tour_information_params)
    if @info.save
      redirect_to tour_path(id: params[:tour_id])
    else
      @tour = Tour.find(params[:id])
      @tours = Event.where(tour_id: params[:id])
      @informations = TourInformation.where(tour_id: params[:id]).order(created_at: "DESC")
      render 'tours/show', status: :unprocessable_entity
    end
  end

  private

  def tour_information_params
    params.require(:tour_information).permit(:body).merge(user_id: current_user.id, tour_id: params[:tour_id])
  end
end
