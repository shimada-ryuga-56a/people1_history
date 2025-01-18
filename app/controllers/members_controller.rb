class MembersController < ApplicationController
  def index
    @members = Member.eager_load(:instruments).order(:id)
  end

  def show
    @member = Member.eager_load([instruments: [gears: :image_attachment]], :image_attachment).find(params[:id])
  end

  def image
    @member = Member.find(params[:id])
  end
end
