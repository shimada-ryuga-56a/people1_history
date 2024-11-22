class TourInformationsController < ApplicationController
  def create
    @info = TourInformation.new(tour_information_params)
    respond_to do |format|
      if @info.save
        @tour = Tour.find(@info.tour_id)
        format.turbo_stream
      else
        @tour = Tour.find(params[:tour_id])
        @tours = Event.where(tour_id: params[:tour_id])
        @informations = TourInformation.where(tour_id: params[:id]).order(created_at: 'DESC')
        format.html { render 'tours/show', status: :unprocessable_entity }
      end
    end
  end

  private

  def tour_information_params
    params.require(:tour_information).permit(:body).merge(user_id: current_user.id, tour_id: params[:tour_id])
  end
end
