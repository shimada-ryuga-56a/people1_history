class SetlistitemInformation < ApplicationRecord
  belongs_to :user
  belongs_to :setlistitem

  validates :body, presence: true
  validates :user_id, presence: true
  validates :setlistitem_id, presence: true
end
