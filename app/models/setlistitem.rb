class Setlistitem < ApplicationRecord
  belongs_to :setlist

  validates :is_song, inclusion: { in: [true, false] }
  validates :is_arranged, inclusion: { in: [true, false] }
  validates :is_encore, inclusion: { in: [true, false] }
  validates :song_title, presence: true
end
