class LikesOnMemberInfosController < ApplicationController
  def create
    @info = MemberInformation.find(params[:member_information_id])
    @like = @info.likes_on_member_infos.new(user_id: current_user.id)
    @like.save
    respond_to do |format|
      format.turbo_stream { render 'members/likes_on_member_info/like' }
    end
  end

  def destroy
    @info = MemberInformation.find(params[:member_information_id])
    @like = @info.likes_on_member_infos.find_by(user_id: current_user.id)
    @like.destroy
    respond_to do |format|
      format.turbo_stream { render 'members/likes_on_member_info/unlike' }
    end
  end
end
