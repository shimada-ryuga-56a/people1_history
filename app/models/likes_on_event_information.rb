class LikesOnEventInformation < ApplicationRecord
  belongs_to :user
  belongs_to :event_information_id

  has_many :notices, as: :noticeable, dependent: :destroy

  private

  def create_notice(user)
    Notice.create!(noticeable: self, user_id: user.id, action_type: Notice.action_types[:liked])
  end
end
