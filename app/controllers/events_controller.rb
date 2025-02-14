class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show image]

  def index
    @categories = Event.categories
    @q = Event.includes(event_bookmarks: :user).ransack(params[:q])
    @events = if params[:q].present?
                @q.result(distinct: true).order(date: :desc).page(params[:page])
              else
                Event.past.order(date: :desc).page(params[:page])
              end
  end

  def show
    @event = Event.includes(:setlist).find(params[:id])
    @youtube_contents = @event.links.where(platform: 'YouTube').or(@event.links.where(platform: 'YouTubeMusic'))
    @tiktok_contents = @event.links.where(platform: 'TikTok')
    @disc_contents = DiscContent.includes(:event, disc_version: :disc).where(event_id: params[:id])
    @info = EventInformation.new
    @event_infomations = EventInformation.includes([:user, :likes_on_event_informations])
                                         .where(event_id: params[:id]).order(created_at: :desc)
    # 下記、セットリストが存在する場合のみ処理を行う
    return unless @event.setlist

    @setlistitems = Setlistitem.where(setlist_id: @event.setlist.id)
    @infos = []
    @setlistitems.each do |item|
      @infos << SetlistitemInformation
                .eager_load(:user, :likes_on_setlistitem_informations)
                .where(setlistitem_id: item.id).order(created_at: :desc)
    end
    @infos.flatten!
    @setlistitem_new_info = SetlistitemInformation.new
    prepare_meta_tags(@event)
  end

  def image
    @event = Event.includes(visual_image_attachment: :blob).find(params[:id])
  end

  def search
    if params[:q] =~ /\A[ぁ-んー－]+\z/
      search_word = convert_to_katakana(params[:q])
    else
      search_word = params[:q]
    end
    @events = Event.where(['name LIKE(?) or name_kana_ruby LIKE(?)', "%#{search_word}%", "%#{search_word}%"])
    respond_to do |format|
      format.js
    end
  end

  private

  def convert_to_katakana(str)
    str.tr('ぁ-ん', 'ァ-ン')
  end

  def prepare_meta_tags(event)
    event_date = event.date.strftime('%Y/%m/%d')
    event_place = event.place.truncate(20)
    event_name = event.name.gsub('\'', ' ').truncate(66)
    remark = 'PEOPLE 1 セットリスト'
    event_data = "date:#{event_date}, place:#{event_place}, name:#{event_name}, remark:#{remark}"
    image_url = "#{request.base_url}/images/ogp.png?text=#{CGI.escape(event_data)}"
    set_meta_tags og: {
                    site_name: 'ぴぽの掲示板',
                    title: 'ぴぽの掲示板',
                    description: 'セットリスト情報を閲覧できます。',
                    type: 'website',
                    url: request.original_url,
                    image: image_url,
                    locale: 'ja-JP'
                  },
                  twitter: {
                    card: 'summary_large_image',
                    site: '@https://x.com/ohkyoku',
                    image: image_url
                  }
  end
end
