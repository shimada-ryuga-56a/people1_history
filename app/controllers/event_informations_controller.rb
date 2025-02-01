class EventInformationsController < ApplicationController
  def create
    @info = EventInformation.new(event_information_params)
    @event = Event.find(params[:event_id])
    respond_to do |format|
      if @info.save
        @infos = EventInformation.eager_load(:user,
                                             :likes_on_event_informations).where(event_id: @event.id).order(created_at: :desc)
        @new_info = EventInformation.new
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream { render 'create' }
      else
        @new_info = @info
        flash.now[:error] = I18n.t('flash.error.post')
        format.turbo_stream { render 'create_failure', status: :unprocessable_entity }
      end
    end
  end

  private

  def event_information_params
    params.expect(event_information: [:body]).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
