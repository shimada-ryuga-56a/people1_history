class LinkViewCount < ApplicationRecord
  belongs_to :link
  validates :view_count, presence: true
  validates :date, presence: true
end
