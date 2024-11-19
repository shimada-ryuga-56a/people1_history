class LikesOnEventInformation < ApplicationRecord
  belongs_to :user
  belongs_to :event_information

  has_many :notices, as: :noticeable, dependent: :destroy

  after_create :create_notice
  before_destroy :destroy_notice

  private

  def create_notice
    @notice = Notice.new(noticeable_type: LikesOnEventInformation, noticeable_id: id, from_whom_id: user.id,
                         user_id: self.event_information.user_id, action_type: Notice.action_types[:like])
    @notice.save
  end

  def destroy_notice
    @notice = Notice.find_by(noticeable_type: 'LikesOnEventInformation', noticeable_id: id, from_whom_id: user.id)
    @notice.destroy if @notice.present?
  end
end
