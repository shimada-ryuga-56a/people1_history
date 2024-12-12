class Discs::InformationsController < ApplicationController
  def create
    disc = Disc.find(params[:disc_id])
    @new_info = disc.informations.build(information_params)
    if @new_info.save
      p "保存できた"
      p @new_info
    else
      p "保存できてない"
      p @new_info
    end
  end

  private

  def information_params
    params.require(:information).permit(:body).merge(user_id: current_user.id)
  end
end
