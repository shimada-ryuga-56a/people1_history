class LinkDate < ApplicationRecord
  belongs_to :link

  validates :date, presence: true
  validates :date_type, presence: true
  validates :link_id, presence: true

  enum date_type: { announcement: 0, release: 1, postponement: 2 }
end
