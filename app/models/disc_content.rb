class DiscContent < ApplicationRecord
  belongs_to :disc_version
  belongs_to :event, optional: true

  validates :content_type, presence: true

  enum :content_type, { songs: 0, events: 1, others: 2 }
end
