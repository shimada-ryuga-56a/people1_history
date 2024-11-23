class EventInformationsController < ApplicationController
  def create
    @info = EventInformation.new(event_information_params)
    respond_to do |format|
      if @info.save
        @new_info = EventInformation.new
        @event = Event.find(params[:event_id])
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream { render 'create' }
      else
        @event = Event.includes(:setlist).find(params[:event_id])
        @new_info = @info
        flash.now[:error] = I18n.t('flash.error.post')
        format.turbo_stream { render 'create_failure', status: :unprocessable_entity }
      end
    end
  end

  private

  def event_information_params
    params.require(:event_information).permit(:body).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
