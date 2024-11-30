class DiscContent < ApplicationRecord
  belongs_to :disc_version
  belongs_to :event, optional: true
  has_many :disc_items, dependent: :destroy

  validates :content_type, presence: true

  enum :content_type, { songs: 0, events: 1, others: 2 }
end
