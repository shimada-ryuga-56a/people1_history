class SongInformationsController < ApplicationController
  def create
    @info = SongInformation.new(song_information_params)
    @song = Song.find(params[:song_id])
    respond_to do |format|
      if @info.save
        @new_song_information = SongInformation.new
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream
      else
        @new_song_information = @info
        @song_informations = SongInformation.where(song_id: params[:song_id]).order(created_at: 'DESC')
        format.html { render 'songs/show', status: :unprocessable_entity }
      end
    end
  end

  private

  def song_information_params
    params.require(:song_information).permit(:body).merge(user_id: current_user.id, song_id: params[:song_id])
  end
end
