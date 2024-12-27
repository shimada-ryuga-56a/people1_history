class ImagesController < ApplicationController
  def history_image_destroy
    @history = current_user.histories.find(params[:history_id])
    @image = @history.image
    @image.purge
    redirect_to edit_history_path(@history)
  end
end
