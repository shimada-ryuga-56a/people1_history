class LikesOnEventInformation < ApplicationRecord
  belongs_to :user
  belongs_to :event_information

  has_many :notices, as: :noticeable, dependent: :destroy

  def create_notice(user)
    @notice = Notice.new(noticeable_type: LikesOnEventInformation, noticeable_id: self.id, user_id: user.id, action_type: Notice.action_types[:like])
    @notice.save
  end
end
