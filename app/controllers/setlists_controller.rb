class SetlistsController < ApplicationController
  def new
    @setlist = Setlist.new
    @setlist.setlistitems.build
  end

  def create
    # binding.pry
    @setlist = Setlist.new(setlist_params)
    if @setlist.save
      redirect_to events_path
    else
      puts "#{@setlist.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def setlist_params
    params.permit(setlistitems_attributes: [:song_title, :position, :is_encore, :is_song, :is_arranged, :_destroy]).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
