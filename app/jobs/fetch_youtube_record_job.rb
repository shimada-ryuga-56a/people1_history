class FetchYoutubeRecordJob < ApplicationJob
  queue_as :default

  def perform(*args)
    require 'google/apis/youtube_v3'
    @links = Link.where(platform: 0)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ENV['YOUTUBE_API_KEY']
    @links.each do |link|
      @response = service.list_videos('statistics', id: link.extract_youtube_id)
      p @response.items.first.statistics.view_count
    end
  end
end
