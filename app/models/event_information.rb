class EventInformation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :likes_on_event_informations, dependent: :destroy

  validates :body, presence: true


  def liked_by?(user)
    likes_on_event_informations.exists?(user_id: user.id)
  end
end
