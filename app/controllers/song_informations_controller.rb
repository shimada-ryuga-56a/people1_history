class SongInformationsController < ApplicationController
  def create
    song_information = current_user.song_informations.build(song_information_params)
    if song_information.save
      redirect_to song_path(song_information.song), success: '保存できました'
    else
      redirect_to song_path(song_information.song), danger: '保存できませんでした'
    end
  end

  private

  def song_information_params
    params.require(:song_information).permit(:body).merge(song_id: params[:song_id])
  end
end
