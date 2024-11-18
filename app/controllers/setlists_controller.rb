class SetlistsController < ApplicationController
  def new
    @setlist = Setlist.new
    50.times { @setlist.setlistitems.build }
  end

  def create
    @event = Event.find(params[:event_id])
    setlist_inspection && return
    @setlist = Setlist.new(setlist_params)
    @setlist.setlistitems.each(&:set_song_id)

    if @setlist.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search
    @songs = Song.where(['name_kana_ruby LIKE(?) or name LIKE(?) or name_hiragana_ruby LIKE(?)', "%#{params[:q]}%",
                         "%#{params[:q]}%", "%#{params[:q]}%"])
    respond_to do |format|
      format.js
    end
  end

  private

  def setlist_params
    params.require(:setlist).permit(
      :event_id,
      setlistitems_attributes: [:song_title, :position, :is_encore, :is_song, :is_arranged, :is_rehearsal, :_destroy]
    ).merge(user_id: current_user.id, event_id: params[:event_id])
  end

  def setlist_inspection
    return if @event.setlist.blank?

    flash[:error] = I18n.t('flash.error.setlist_exist')
    redirect_to event_path(@event.id)
  end
end
