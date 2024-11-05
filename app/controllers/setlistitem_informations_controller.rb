class SetlistitemInformationsController < ApplicationController
  def create
    @new_info = SetlistitemInformation.new(setlistitem_information_params)
    if @new_info.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def setlistitem_information_params
    params.require(:setlistitem_information).permit(:body, :setlistitem_id).merge(user_id: current_user.id)
  end
end
