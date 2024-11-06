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
    @songs = Song.where('name_kana_ruby like ?', "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  private

  def setlist_params
    params.require(:setlist).permit(
      :event_id,
      setlistitems_attributes: [:song_title, :position, :is_encore, :is_song, :is_arranged, :_destroy]
    ).merge(user_id: current_user.id, event_id: params[:event_id])
  end

  def setlist_inspection
    if @event.setlist.present?
      flash[:error] =  "すでにセットリストが存在します。"
      redirect_to event_path(@event.id)
      p alert
      p flash
    end
  end
end
