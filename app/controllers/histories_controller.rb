class HistoriesController < ApplicationController
  def index
    params_inspection
    @histories = []
    add_to_histories(:events, Event)
    if params[:discs] == '1'
      @histories << Disc.where.not(release_date: nil).select(:title, :release_date, :production_type, :id)
      @histories << Disc.where.not(announcement_date: nil).select(:title, :announcement_date, :production_type,
                                                                  :id)
    end
    add_to_histories(:histories, History)
    add_to_histories(:tie_ups, TieUp)

    return if @histories.empty?
    p @histories

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
    @new_info = @history.informations.build
    @form_url = history_informations_path(history_id: @history.id)
    @infos = Information.includes(:user).where(reportable_type: 'History', reportable_id: @history.id).order(created_at: :desc)
  end

  def new
    @history = History.new
  end

  def edit
    @history = current_user.histories.find_by(id: params[:id])
    return if @history.present?

    flash[:error] = I18n.t('flash.error.not_editing_permission')
    redirect_to histories_path
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

  def update
    @history = current_user.histories.find(params[:id])
    if @history.update(history_params)
      flash[:success] = I18n.t('flash.success.update_post')
      redirect_to histories_path
    else
      flash.now[:error] = I18n.t('flash.error.update_post')
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @history = History.find(params[:id])
    return if @history.user != current_user

    @history.destroy
    flash[:success] = I18n.t('flash.success.delete_post')
    redirect_to histories_path
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
    valid_values = %w[0 1]
    params[:events] = '1' if params[:events].nil?
    params[:discs] = '1' if params[:discs].nil?
    params[:histories] = '1' if params[:histories].nil?
    params[:tie_ups] = '1' if params[:tie_ups].nil?
    params[:events] = valid_values.include?(params[:events]) ? params[:events] : '0'
    params[:discs] = valid_values.include?(params[:discs]) ? params[:discs] : '0'
    params[:histories] = valid_values.include?(params[:histories]) ? params[:histories] : '0'
    params[:tie_ups] = valid_values.include?(params[:tie_ups]) ? params[:tie_ups] : '0'
  end

  def add_to_histories(param_key, model)
    return if params[param_key] == '0'

    return unless params[param_key] == '1'

    @histories << model.all
  end
end
