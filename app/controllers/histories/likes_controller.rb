class Histories::LikesController < ApplicationController
  def create
    @history = History.preload(:likes).find(params[:history_id])
    likes = @history.likes.new(user_id: current_user.id)
    likes.save
    respond_to do |format|
      format.turbo_stream { render 'likes/create' }
    end
  end

  def destroy
  end
end
