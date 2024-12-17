class HistoriesController < ApplicationController
  def index
    @histories = Array.new
    @histories << Event.all
    @histories << Disc.all
    @histories.flatten!.sort_by! { |history|
      if history.respond_to?("date")
        history.date
      else
        history.release_date
      end
    }
    @histories = Kaminari.paginate_array(@histories).page(params[:page]).per(20)
  end
end
