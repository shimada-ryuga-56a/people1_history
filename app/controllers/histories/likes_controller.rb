class Histories::LikesController < ApplicationController
  def create
    @history = History.find(params[:history_id])
    like = @history.likes.new(user_id: current_user.id)
    like.save
    respond_to do |format|
      format.turbo_stream { render 'likes/create', locals: { obj: @history, history: @history } }
    end
  end

  def destroy
    @history = History.find(params[:history_id])
    like = @history.likes.find_by(user_id: current_user.id, likable_id: @history.id)
    like.destroy
    respond_to do |format|
      format.turbo_stream { render 'likes/destroy', locals: { obj: @history, history: @history } }
    end
  end
end
