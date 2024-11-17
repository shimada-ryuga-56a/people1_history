class LikesOnEventInformation < ApplicationRecord
  belongs_to :user
  belongs_to :event_information

  has_many :notices, as: :noticeable, dependent: :destroy

  after_create :create_notice
  before_destroy :destroy_notice

  private

  def create_notice
    @notice = Notice.new(noticeable_type: LikesOnEventInformation, noticeable_id: self.id, user_id: self.user.id, action_type: Notice.action_types[:like])
    @notice.save
  end

  def destroy_notice
    @notice = Notice.find_by(noticeable_type: "LikesOnEventInformation", noticeable_id: self.id, user_id: self.user.id)
    @notice.destroy if @notice.present?
  end
end
