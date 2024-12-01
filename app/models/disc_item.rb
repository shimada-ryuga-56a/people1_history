class DiscItem < ApplicationRecord
  belongs_to :disc_content
  belongs_to :song, optional: true

  validates :position, presence: true
  validates :is_arranged, inclusion: { in: [true, false] }
end
