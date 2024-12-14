class DiscsController < ApplicationController
  def show
    @disc = Disc.includes(link_contents: :link).find(params[:id])
    @link_contents = @disc.link_contents
    @disc_versions = DiscVersion.includes(:disc).where(disc_id: params[:id])
    @disc_contents = DiscContent.includes(:event, disc_version: :disc).where(disc: { id: params[:id] }).order(:id)
    @disc_items = DiscItem.includes(:song, disc_content: [:event, { disc_version: :disc }]).where(disc: { id: params[:id] })
    @new_info = @disc.informations.build
    @form_url = disc_informations_path(disc_id: @disc.id)
    @infos = Information.includes(:user).where(reportable_type: 'Disc', reportable_id: @disc.id).order(created_at: :desc)
  end

  def jacket
    @disc_version = DiscVersion.find(params[:id])
  end
end
