class LikesOnEventInformation < ApplicationRecord
  belongs_to :user
  belongs_to :event_information_id

  has_many :notices, as: :noticeable, dependent: :destroy
end
