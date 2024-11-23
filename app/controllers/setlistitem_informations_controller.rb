class SetlistitemInformationsController < ApplicationController
  def create
    @info = SetlistitemInformation.new(setlistitem_information_params)
    @item = Setlistitem.find(@info.setlistitem_id)
    respond_to do |format|
      if @info.save
        @setlistitem_new_info = SetlistitemInformation.new
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream
      else
        @setlistitem_new_info = @info
        format.turbo_stream { render 'create_failure', status: :unprocessable_entity }
        flash.now[:error] = I18n.t('flash.error.post')
      end
    end
  end

  private

  def setlistitem_information_params
    params.require(:setlistitem_information).permit(:body, :setlistitem_id).merge(user_id: current_user.id)
  end
end
