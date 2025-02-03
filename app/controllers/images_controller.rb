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
    info = set_info(text)
    sub_info = set_sub_info(text)
    remark = set_remark(text)
    image = OgpCreator.build(info, sub_info, remark).tempfile.open.read
    send_data image, type: 'image/png', disposition: 'inline'
  end

  private

  def ogp_params
    params.permit(:text)
  end

  def set_info(text)
    text.match(/name:(.+), remark:/)[1]
  end

  def set_sub_info(text)
    text.match(/date:(.+), place:/)[1] + " @" + text.match(/place:(.+), name:/)[1]
  end

  def set_remark(text)
    text.match(/remark:(.+)$/)[1]
  end
end
