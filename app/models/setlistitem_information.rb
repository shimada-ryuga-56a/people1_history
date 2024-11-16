class SetlistitemInformation < ApplicationRecord
  belongs_to :user
  belongs_to :setlistitem
  has_many :likes_on_setlistitem_informations, dependent: :destroy

  validates :body, presence: true

  def liked_by?(user)
    likes_on_setlistitem_informations.exists?(user_id: user.id)
  end
end
