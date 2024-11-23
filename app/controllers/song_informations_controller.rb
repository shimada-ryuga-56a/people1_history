class SongInformationsController < ApplicationController
  def create
    @info = current_user.song_informations.build(song_information_params)
    respond_to do |format|
      if @info.save
        @new_info = SongInformation.new
        @song = Song.find(params[:song_id])
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream
      else
        format.html { redirect_to song_path(@info.song), danger: '保存できませんでした' }
      end
    end
  end

  private

  def song_information_params
    params.require(:song_information).permit(:body).merge(song_id: params[:song_id])
  end
end
