class TourInformation < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  has_many :likes_on_tour_informations, dependent: :destroy

  validates :body, presence: true

  def liked_by?(user)
    likes_on_tour_informations.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "id_value", "tour_id", "updated_at", "user_id"]
  end
end
