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
    info = info_extraction(text)
    sub_info = sub_info_extraction(text)
    remark = remark_extraction(text)
    image = OgpCreator.build(info, sub_info, remark).tempfile.open.read
    send_data image, type: 'image/png', disposition: 'inline'
  end

  private

  def ogp_params
    params.permit(:text)
  end

  def info_extraction(text)
    text.match(/name:(.+), remark:/)[1]
  end

  def sub_info_extraction(text)
    "#{text.match(/date:(.+), place:/)[1]} @#{text.match(/place:(.+), name:/)[1]}"
  end

  def remark_extraction(text)
    text.match(/remark:(.+)$/)[1]
  end
end
