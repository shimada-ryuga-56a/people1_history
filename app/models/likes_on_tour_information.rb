class LikesOnTourInformation < ApplicationRecord
  belongs_to :user
  belongs_to :tour_information

  has_many :notices, as: :noticeable, dependent: :destroy

  after_create :create_notice
  before_destroy :destroy_notice

  private

  def create_notice
    @notice = Notice.new(noticeable_type: LikesOnTourInformation, noticeable_id: id, user_id: user.id,
                         action_type: Notice.action_types[:like])
    @notice.save
  end

  def destroy_notice
    @notice = Notice.find_by(noticeable_type: 'LikesOnTourInformation', noticeable_id: id, user_id: user.id)
    @notice.destroy if @notice.present?
  end
end
