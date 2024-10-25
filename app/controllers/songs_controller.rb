class SongsController < ApplicationController
  def index
    @songs = Song.all.order(name_kana_ruby: :asc)
  end

  def show
    @song = Song.find(params[:id])
  end
end
