class DiscsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[jacket]

  def show
    @disc = Disc.find(params[:id])
    @youtube_contents = @disc.links.where(platform: "YouTube").or(@disc.links.where(platform: "YouTubeMusic"))
    @tiktok_contents = @disc.links.where(platform: "TikTok")
    @disc_versions = DiscVersion.includes(:disc).where(disc_id: params[:id])
    @disc_contents = DiscContent.eager_load(:event, disc_version: :disc).where(disc: { id: params[:id] }).order(:id)
    @disc_items = DiscItem.includes(:song, disc_content: [:event, { disc_version: :disc }]).where(disc: { id: params[:id] })
    @new_info = @disc.informations.build
    @form_url = disc_informations_path(disc_id: @disc.id)
    @infos = Information.includes(:user, :likes_on_informations).where(reportable_type: 'Disc', reportable_id: @disc.id).order(created_at: :desc)
  end

  def jacket
    @disc_version = DiscVersion.find(params[:id])
  end
end
