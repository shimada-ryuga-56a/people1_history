class SongsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show jacket]

  def index
    @q = Song.ransack(params[:q])
    @songs = @q.result(distinct: true).order(name_kana_ruby: :asc).page(params[:page])
  end

  def show
    @song = Song.find(params[:id])
    @youtube_contents = @song.links.where(platform: 'YouTube').or(@song.links.where(platform: 'YouTubeMusic'))
    @tiktok_contents = @song.links.where(platform: 'TikTok')
    @new_song_information = SongInformation.new
    @song_informations = @song.song_informations.includes(:user, :likes_on_song_informations).order(created_at: :desc)
    @events = Event.includes(setlist: :setlistitems).where(setlistitems: { song_id: params[:id] }).order(:date)
    @song_disc_items = DiscItem.includes(disc_content: { disc_version: :disc })
                               .where(disc_contents: { content_type: 0 },
                                      disc_items: { song_id: params[:id] }).decorate
    @movie_disc_items = DiscItem.includes(disc_content: [:event, { disc_version: :disc }]).where(
      disc_contents: { content_type: [1, 2] }, disc_items: { song_id: params[:id] }
    ).decorate
  end

  def search
    @songs = Song.where(['name_kana_ruby LIKE(?) or name LIKE(?) or name_hiragana_ruby LIKE(?)', "%#{params[:q]}%",
                         "%#{params[:q]}%", "%#{params[:q]}%"])
    respond_to do |format|
      format.js
    end
  end

  def jacket
    @song = Song.find(params[:id])
    return if @song.disc_items.blank?

    @item = DiscItem.left_joins(disc_content: { disc_version: :disc }).where(
      song_id: params[:id]
    ).order('discs.release_date ASC').first
    @jacket = @item.disc_content.disc_version.jacket if @item.disc_content.disc_version.jacket.attached?
  end
end
