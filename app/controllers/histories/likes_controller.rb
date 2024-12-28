class Histories::LikesController < ApplicationController
  def create
    history = History.find(params[:history_id])
    likes = history.likes.new(user_id: current_user.id)
    likes.save
    redirect_to histories_path
  end

  def destroy
  end
end
