class DiscsController < ApplicationController
  def show
    @disc_items = DiscItem.includes(disc_content: { disc_version: :disc }).where(disc: {id: params[:id]})
    p @disc_items
  end
end
