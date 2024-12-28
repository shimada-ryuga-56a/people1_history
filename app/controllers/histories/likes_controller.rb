class Histories::LikesController < ApplicationController
  def create
    @history = History.preload(:likes).find(params[:history_id])
    like = @history.likes.new(user_id: current_user.id)
    like.save
    obj = @history
    respond_to do |format|
      format.turbo_stream { render 'likes/create', locals: { obj: @history } }
    end
  end

  def destroy
  end
end
