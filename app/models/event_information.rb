class EventInformation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :likes_on_event_informations, dependent: :destroy

  validates :body, presence: true
end
