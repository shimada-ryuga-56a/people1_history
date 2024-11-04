class Setlistitem < ApplicationRecord
  belongs_to :setlist

  validates :is_song, inclusion: { in: [true, false] }
  validates :is_arranged, inclusion: { in: [true, false] }
  validates :is_encore, inclusion: { in: [true, false] }
  validates :song_title, presence: true

  def set_song_id
    @song = Song.find_by(name: "#{self.song_title}")
    if @song
      self.song_id = @song.id
    end
  end
end
