class TourInformationsController < ApplicationController
  def create
    @info = TourInformation.new(tour_information_params)
    if @info.save
      redirect_to tour_path(id: params[:id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def tour_information_params
    params.require(:tour_information).permit(:body).merge(user_id: current_user.id, tour_id: params[:id])
  end
end
