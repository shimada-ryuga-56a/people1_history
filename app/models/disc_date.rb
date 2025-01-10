class DiscDate < ApplicationRecord
  validates :date, presence: true
  validates :disc_id, presence: true
  validates :date_type, presence: true

  enum :date_type, { announcement: 0, release: 1, postponement: 2 }
end
