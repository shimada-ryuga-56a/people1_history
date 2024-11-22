class SongInformationsController < ApplicationController
  def create
    @info = current_user.song_informations.build(song_information_params)
    respond_to do |format|
      if @info.save
        @new_info = SongInformation.new
        @song = Song.find(params[:song_id])
        format.turbo_stream
        # redirect_to song_path(@info.song), success: '保存できました'
      else
        format.html {redirect_to song_path(@info.song), danger: '保存できませんでした'}
      end
    end
  end

  private

  def song_information_params
    params.require(:song_information).permit(:body).merge(song_id: params[:song_id])
  end
end
