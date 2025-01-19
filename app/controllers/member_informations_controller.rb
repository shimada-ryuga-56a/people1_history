class MemberInformationsController < ApplicationController
  def create
    @member_information = MemberInformation.new(member_params)
    respond_to do |format|
      if @member_information.save
        @new_info = MemberInformation.new
        @member = Member.find(params[:member_id])
        @member_informations = @member.member_informations.includes(:user, :rich_text_content).order(created_at: :desc)
        flash.now[:success] = I18n.t('flash.success.post')
        format.turbo_stream { render 'members/turbo_stream/info_create' }
      else
        redirect_to member_path(@member_information.member)
      end
    end
  end

  private

  def member_params
    params.require(:member_information).permit(:content).merge(user_id: current_user.id, member_id: params[:member_id])
  end
end
