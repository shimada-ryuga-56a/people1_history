class Setlistitem < ApplicationRecord
  belongs_to :setlist
  has_many :setlistitem_informations, dependent: :destroy

  validates :is_song, inclusion: { in: [true, false] }
  validates :is_arranged, inclusion: { in: [true, false] }
  validates :is_encore, inclusion: { in: [true, false] }
  validates :song_title, presence: true

  def set_song_id
    @song = Song.find_by(name: song_title.to_s)
    return unless @song

    self.song_id = @song.id
  end
end
