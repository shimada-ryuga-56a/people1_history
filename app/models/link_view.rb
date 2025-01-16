class LinkView < ApplicationRecord
  belongs_to :link

  validates :date, presence: true
  validates :record_type, presence: true

  enum :record_type, { one_million: 0, ten_million: 1, hundred_million: 2, one_billion: 3 }
end
