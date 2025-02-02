class ImagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:ogp]

  def history_image_destroy
    @history = current_user.histories.find(params[:history_id])
    @image = @history.image
    @image.purge
    redirect_to edit_history_path(@history)
  end

  def ogp
    text = ogp_params[:text]
    image = OgpCreator.build(text).tempfile.open.read
    send_data image, type: 'image/png', disposition: 'inline'
  end

  private

  def ogp_params
    params.permit(:text)
  end
end
