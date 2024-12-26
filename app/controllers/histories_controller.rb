class HistoriesController < ApplicationController
  def index
    params_inspection
    @histories = []
    @histories << Event.all if params[:events] == "1"
    @histories << Disc.where.not(release_date: nil).select(:title, :release_date, :production_type, :id) if params[:discs] == "1"
    @histories << Disc.where.not(announcement_date: nil).select(:title, :announcement_date, :production_type, :id) if params[:discs] == "1"
    @histories << History.all if params[:histories] == "1"

    return if @histories.empty?
    @histories.flatten!.sort_by! do |history|
      if history.respond_to?('date')
        history.date
      elsif history.respond_to?('announcement_date')
        history.announcement_date
      elsif history.respond_to?('release_date')
        history.release_date
      end
    end
    @histories = Kaminari.paginate_array(@histories).page(params[:page]).per(20)
  end

  def show
    @history = History.find(params[:id])
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
      render 'new', status: :unprocessable_entity
    end
  end

  def disc_image
    @disc = Disc.find(params[:id])
    @disc_version = DiscVersion.includes(jacket_attachment: :blob).where(disc_id: @disc.id).first
  end

  def event_image
    @event = Event.includes(visual_image_attachment: :blob).find(params[:id])
  end

  def history_image
    @history = History.includes(image_attachment: :blob).find(params[:id])
  end

  def show_page_image
    @history = History.includes(image_attachment: :blob).find(params[:id])
  end

  private

  def history_params
    params.require(:history).permit(:title, :remark, :date, :image).merge(user_id: current_user.id)
  end

  def params_inspection
    valid_values = ["0", "1"]
    params[:events] = valid_values.include?(params[:events]) ? params[:events] : nil
    params[:discs] = valid_values.include?(params[:discs]) ? params[:discs] : nil
    params[:histories] = valid_values.include?(params[:histories]) ? params[:histories] : nil
  end
end
