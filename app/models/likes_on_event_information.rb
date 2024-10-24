class LikesOnEventInformation < ApplicationRecord
  belongs_to :user
  belongs_to :event_information
end
