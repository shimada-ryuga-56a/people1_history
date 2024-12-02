class DiscsController < ApplicationController
  def show
    @disc = Disc.find(params[:id])
    @disc_versions = DiscVersion.includes(:disc).where(disc_id: params[:id])
    @disc_contents = DiscContent.includes(disc_version: :disc).where(disc: {id: params[:id]})
    @disc_items = DiscItem.includes(disc_content: [:event, { disc_version: :disc }]).where(disc: {id: params[:id]})
  end
end
