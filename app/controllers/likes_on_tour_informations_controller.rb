class LikesOnTourInformationsController < ApplicationController
  def create
    tour_information = TourInformation.find(params[:tour_information_id])
    likes_on_tour_information = current_user.likes_on_tour_informations.new(tour_information_id: tour_information.id)
    likes_on_tour_information.save
    redirect_to tour_path(id: tour_information.tour.id)
  end

  def destroy
    tour_information = TourInformation.find(params[:tour_information_id])
    likes_on_tour_information = current_user.likes_on_tour_informations.find_by(tour_information_id: tour_information.id)
    likes_on_tour_information.destroy
    redirect_to tour_path(id: tour_information.tour.id)
  end
end
