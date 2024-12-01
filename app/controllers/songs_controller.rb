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
    @discs = Disc.joins(disc_versions: {disc_contents: :disc_items}).where(disc_items: {song_id: 1}).select(:title, :version)
  end
end
