class FetchYoutubeRecordJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    require 'google/apis/youtube_v3'
    @links = Link.where(platform: 0)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ENV.fetch('YOUTUBE_API_KEY', nil)
    @links.each do |link|
      @response = service.list_videos('statistics', id: link.extract_youtube_id)
      Rails.logger.debug @response.items.first.statistics.view_count
    end
  end
end
