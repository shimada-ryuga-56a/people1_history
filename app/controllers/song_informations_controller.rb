class SongInformationsController < ApplicationController
  def create
    @info = SongInformation.new(song_information_params)
    @song = Song.find(params[:song_id])
    respond_to do |format|
      if @info.save
        @new_song_information = SongInformation.new
        @song_informations = SongInformation.where(song_id: params[:song_id]).order(created_at: :desc)
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream
      else
        @new_song_information = @info
        @song_informations = SongInformation.where(song_id: params[:song_id]).order(created_at: :desc)
        flash.now[:error] = I18n.t('flash.error.post')
        format.turbo_stream { render 'create_failure', status: :unprocessable_entity }
      end
    end
  end

  private

  def song_information_params
    params.expect(song_information: [:body]).merge(user_id: current_user.id, song_id: params[:song_id])
  end
end
