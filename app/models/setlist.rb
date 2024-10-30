class Setlist < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :setlistitems, dependent: :destroy

  validates :event_id, presence: true
end
