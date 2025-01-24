class Histories::InformationsController < ApplicationController
  def create
    @history = History.find(params[:history_id])
    @info = @history.informations.build(information_params)
    @form_url = history_informations_path(history_id: @history.id)
    respond_to do |format|
      if @info.save
        @new_info = @history.informations.build
        @reportable = @history
        @type = "history"
        @infos = @history.informations.order(created_at: :desc)
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream { render 'informations/create' }
      else
        @new_info = @info
        flash.now[:error] = I18n.t('flash.error.post')
        format.turbo_stream { render 'informations/create_failure', status: :unprocessable_entity }
      end
    end
  end

  private

  def information_params
    params.require(:information).permit(:body).merge(user_id: current_user.id)
  end
end
