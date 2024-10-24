class LikesOnTourInformation < ApplicationRecord
  belongs_to :user
  belongs_to :tour_information
end
