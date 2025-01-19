class MemberInformationsController < ApplicationController
  def create
    @member_information = MemberInformation.new(member_params)
    if @member_information.save
      redirect_to member_path(@member_information.member)
    else
      redirect_to member_path(@member_information.member)
    end
  end

  private

  def member_params
    params.require(:member_information).permit(:content).merge(user_id: current_user.id, member_id: params[:member_id])
  end
end
