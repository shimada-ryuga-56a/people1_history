class LikesOnTourInformation < ApplicationRecord
  belongs_to :user
  belongs_to :tour_information

  has_many :notices, as: :noticeable, dependent: :destroy
end
