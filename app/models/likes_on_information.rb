class LikesOnInformation < ApplicationRecord
  belongs_to :user
  belongs_to :information

  after_create :create_notice
  before_destroy :destroy_notice

  private

  def create_notice
    return if user.id == information.user_id

    @notice = Notice.new(noticeable_type: LikesOnInformation, noticeable_id: id, from_whom_id: user.id,
                         user_id: information.user_id, action_type: Notice.action_types[:like])
    @notice.save
  end

  def destroy_notice
    @notice = Notice.find_by(noticeable_type: 'LikesOnInformation', noticeable_id: id, from_whom_id: user.id)
    @notice.destroy if @notice.present?
  end
end
