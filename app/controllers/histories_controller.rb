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

  def new
    @history = History.new
  end

  def create
    @history = History.new(history_params)
    if @history.save
      flash[:success] = I18n.t('flash.success.post')
      redirect_to histories_path
    else
      flash.now[:error] = I18n.t('flash.error.post')
      render "new", status: :unprocessable_entity
    end
  end

  def disc_image
    @disc = Disc.find(params[:id])
    @disc_version = DiscVersion.includes(jacket_attachment: :blob).where(disc_id: @disc.id).first
  end

  def event_image
    @event = Event.includes(visual_image_attachment: :blob).find(params[:id])
  end

  private

  def history_params
    params.require(:history).permit(:title, :remark, :date).merge(user_id: current_user.id)
  end
end
