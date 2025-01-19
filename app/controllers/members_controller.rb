class MembersController < ApplicationController
  def index
    @members = Member.eager_load(:instruments).order(:id)
  end

  def show
    @member = Member.eager_load([instruments: [gears: :image_attachment]], :image_attachment).find(params[:id])
    sort_instruments(@member.instruments)
    @new_information = MemberInformation.new
    @informations = @member.member_informations.includes(:user).order(created_at: :desc)
  end

  def image
    @member = Member.find(params[:id])
  end

  def gear_image
    @gear = Gear.find(params[:id])
  end

  private

  def sort_instruments(instruments)
    # うまくいかなかったため後日実装
  end
end
