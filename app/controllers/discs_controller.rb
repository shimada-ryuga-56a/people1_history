class DiscsController < ApplicationController
  def show
    @disc = Disc.find(params[:id])
    @disc_versions = DiscVersion.includes(:disc).where(disc_id: params[:id])
    @disc_contents = DiscContent.includes(:event, disc_version: :disc).where(disc: { id: params[:id] }).order(:id)
    @disc_items = DiscItem.includes(:song, disc_content: [:event, { disc_version: :disc }]).where(disc: { id: params[:id] })
    @new_info = @disc.informations.build
  end

  def jacket
    @disc_version = DiscVersion.find(params[:id])
  end
end
