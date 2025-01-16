class HistoriesController < ApplicationController
  def index
    # params_inspection
    @histories = []
    add_to_histories(:events, Event, nil)
    add_to_histories(:histories, History, [:likes, :user])
    add_to_histories(:tie_ups, TieUp, :song)
    add_to_histories(:disc_dates, DiscDate, :disc)
    add_to_histories(:link_dates, LinkDate, :link)
    add_to_histories(:link_views, LinkView, :link)

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

  def disc_date_image
    @disc_date = DiscDate.eager_load(:disc).find(params[:id])
    @disc = @disc_date.disc
    @disc_version = DiscVersion.includes(jacket_attachment: :blob).where(disc_id: @disc.id).first
  end

  def event_image
    @event = Event.includes(visual_image_attachment: :blob).find(params[:id])
  end

  def history_image
    @history = History.includes(image_attachment: :blob).find(params[:id])
  end

  def tie_up_image
    @tie_up = TieUp.includes(image_attachment: :blob).find(params[:id])
  end

  def show_page_image
    @history = History.includes(image_attachment: :blob).find(params[:id])
  end

  def link_date_image
    @link_date = LinkDate.find(params[:id])
  end

  private

  def history_params
    params.require(:history).permit(:title, :remark, :date, :image).merge(user_id: current_user.id)
  end

  def params_inspection
    valid_values = %w[0 1]
    params[:events] = '1' if params[:events].nil?
    params[:disc_dates] = '1' if params[:disc_dates].nil?
    params[:histories] = '1' if params[:histories].nil?
    params[:tie_ups] = '1' if params[:tie_ups].nil?
    params[:link_dates] = '1' if params[:link_dates].nil?
    params[:link_views] = '1' if params[:link_views].nil?
    params[:events] = valid_values.include?(params[:events]) ? params[:events] : '0'
    params[:disc_dates] = valid_values.include?(params[:disc_dates]) ? params[:disc_dates] : '0'
    params[:histories] = valid_values.include?(params[:histories]) ? params[:histories] : '0'
    params[:tie_ups] = valid_values.include?(params[:tie_ups]) ? params[:tie_ups] : '0'
    params[:link_dates] = valid_values.include?(params[:link_dates]) ? params[:link_dates] : '0'
    params[:link_views] = valid_values.include?(params[:link_views]) ? params[:link_views] : '0'
  end

  def add_to_histories(param_key, model, joiner)
    # return if params[param_key] == '0'

    # return unless params[param_key] == '1'

    @histories << model.eager_load(joiner).all
  end
end
