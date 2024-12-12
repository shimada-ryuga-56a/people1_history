class Discs::InformationsController < ApplicationController
  def create
    @disc = Disc.find(params[:disc_id])
    @info = @disc.informations.build(information_params)
    respond_to do |format|
      if @info.save
        @new_info = @disc.informations.build
        @form_url = disc_informations_path(disc_id: @disc.id)
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream { render 'informations/create' }
      else
        format.turbo_stream { render 'informations/create_failure', status: :unprocessable_entity }
      end
    end
  end

  private

  def information_params
    params.require(:information).permit(:body).merge(user_id: current_user.id)
  end
end
