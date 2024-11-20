class SongsController < ApplicationController
  def index
    @songs = Song.order(name_kana_ruby: :asc).page(params[:page])
  end

  def show
    @song = Song.find(params[:id])
    @song_information = SongInformation.new
    @song_informations = @song.song_informations.includes(:user).order(created_at: :desc)
    @events = Event.joins(setlist: :setlistitems).where(setlistitems: { song_id: params[:id] }).order(:date)
  end
end
