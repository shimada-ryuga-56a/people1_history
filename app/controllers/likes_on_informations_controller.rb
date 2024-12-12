class LikesOnInformationsController < ApplicationController
  def create
    @info = Information.find(params[:information_id])
    likes_on_information = current_user.likes_on_informations.new(information_id: @info.id)
    likes_on_information.save
  end

  def destroy
    @info = Information.find(params[:information_id])
    likes_on_information = current_user.likes_on_informations.find_by(information_id: @info.id)
    likes_on_information.destroy
  end
end
