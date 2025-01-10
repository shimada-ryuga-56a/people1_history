class TieUp < ApplicationRecord
  belongs_to :song

  validates :collaboration_title, presence: true
  validates :song_id, presence: true
  validates :announce_date, presence: true

  has_one_attached :image
end
