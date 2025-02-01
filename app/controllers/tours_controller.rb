class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @youtube_contents = @tour.links.where(platform: 'YouTube').or(@tour.links.where(platform: 'YouTubeMusic'))
    @tiktok_contents = @tour.links.where(platform: 'TikTok')
    @tours = Event.where(tour_id: params[:id]).order(date: :asc)
    @new_info = TourInformation.new
    @informations = TourInformation.includes([:user,
                                              :likes_on_tour_informations]).where(tour_id: params[:id]).order(created_at: :desc)
  end
end
