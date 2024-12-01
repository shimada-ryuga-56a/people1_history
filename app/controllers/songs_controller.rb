class SongsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @songs = Song.order(name_kana_ruby: :asc).page(params[:page])
  end

  def show
    @song = Song.find(params[:id])
    @new_song_information = SongInformation.new
    @song_informations = @song.song_informations.includes(:user).order(created_at: :desc)
    @events = Event.joins(setlist: :setlistitems).where(setlistitems: { song_id: params[:id] }).order(:date)
    @song_disc_items = DiscItem.includes(disc_content: {disc_version: :disc}).where(disc_contents: {content_type: 0}, disc_items: {song_id: params[:id]})
    @movie_disc_items = DiscItem.includes(disc_content: {disc_version: :disc}).where(disc_contents: {content_type: [1, 2]}, disc_items: {song_id: params[:id]})
  end
end
