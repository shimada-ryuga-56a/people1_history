class TourInformationsController < ApplicationController
  def create
    @info = TourInformation.new(tour_information_params)
    respond_to do |format|
      if @info.save
        @new_info = TourInformation.new
        @tour = Tour.find(@info.tour_id)
        @infos = @tour.tour_informations.includes(:user, :likes_on_tour_informations).order(created_at: :desc)
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream { render 'tour_informations/create' }
      else
        @new_info = @info
        @tour = Tour.find(params[:tour_id])
        flash.now[:error] = I18n.t('flash.error.post')
        format.turbo_stream { render 'tour_informations/create_error', status: :unprocessable_entity }
      end
    end
  end

  private

  def tour_information_params
    params.expect(tour_information: [:body]).merge(user_id: current_user.id, tour_id: params[:tour_id])
  end
end
