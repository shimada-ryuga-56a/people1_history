class DiscsController < ApplicationController
  def show
    @disc_items = DiscItem.includes(disc_content: [:event, { disc_version: :disc }]).where(disc: {id: params[:id]})
  end
end
