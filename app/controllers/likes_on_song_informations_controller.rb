class LikesOnSongInformationsController < ApplicationController
  def create
    song_information = SongInformation.find(params[:song_information_id])
    likes_on_song_information = current_user.likes_on_song_informations.new(song_information_id: song_information.id)
    likes_on_song_information.save
    redirect_to song_path(id: song_information.song.id)
  end

  def destroy
    song_information = SongInformation.find(params[:song_information_id])
    likes_on_song_information = current_user.likes_on_song_informations.find_by(song_information_id: song_information.id)
    likes_on_song_information.destroy
    redirect_to song_path(id: song_information.song.id)
  end
end
