class TourInformation < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  has_many :likes_on_tour_informations, dependent: :destroy

  validates :body, presence: true
end
