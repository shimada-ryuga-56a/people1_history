class TourInformationsController < ApplicationController
  def create
    @info = TourInformation.new(tour_information_params)
    respond_to do |format|
      if @info.save
        @new_info = TourInformation.new
        @tour = Tour.find(@info.tour_id)
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream
      else
        @new_info = @info
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
