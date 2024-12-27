class Histories::InformationsController < ApplicationController
  def create
  end

  private

  def information_params
    params.require(:information).permit(:body).merge(user_id: current_user.id)
  end
end
