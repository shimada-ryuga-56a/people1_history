class SetlistitemInformation < ApplicationRecord
  belongs_to :user
  belongs_to :setlistitem

  validates :body, presence: true
end
