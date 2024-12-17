class HistoriesController < ApplicationController
  def index
    @histories = []
    @histories << Event.all
    @histories << Disc.all
    @histories.flatten!.sort_by! do |history|
      if history.respond_to?('date')
        history.date
      else
        history.release_date
      end
    end
    @histories = Kaminari.paginate_array(@histories).page(params[:page]).per(20)
  end

  def disc_image
    @disc = Disc.find(params[:id])
    @disc_version = DiscVersion.includes(jacket_attachment: :blob).where(disc_id: @disc.id).first
  end
end
