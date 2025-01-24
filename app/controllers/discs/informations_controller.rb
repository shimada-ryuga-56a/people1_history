class Discs::InformationsController < ApplicationController
  def create
    @disc = Disc.find(params[:disc_id])
    @info = @disc.informations.build(information_params)
    @form_url = disc_informations_path(disc_id: @disc.id)
    respond_to do |format|
      if @info.save
        @new_info = @disc.informations.build
        @infos = Information.eager_load(:user, :likes_on_informations).where(reportable_type: "Disc", reportable_id: @disc.id).order(created_at: :desc)
        @type = "disc"
        @reportable = @disc
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
