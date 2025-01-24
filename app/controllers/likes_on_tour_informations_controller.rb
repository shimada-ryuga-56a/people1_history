class LikesOnTourInformationsController < ApplicationController
  def create
    @tour_information = TourInformation.find(params[:tour_information_id])
    @like_on_tour_information = current_user.likes_on_tour_informations.new(tour_information_id: @tour_information.id)
    @like_on_tour_information.save
    respond_to do |format|
      format.turbo_stream { render 'tour_informations/like' }
    end
  end

  def destroy
    @tour_information = TourInformation.find(params[:tour_information_id])
    @like_on_tour_information = current_user.likes_on_tour_informations.find_by(tour_information_id: @tour_information.id)
    @like_on_tour_information.destroy
    respond_to do |format|
      format.turbo_stream { render 'tour_informations/like' }
    end
  end
end
