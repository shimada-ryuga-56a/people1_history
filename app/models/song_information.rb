class SongInformation < ApplicationRecord
  belongs_to :user
  belongs_to :song
  has_many :likes_on_song_informations, dependent: :destroy

  validates :body, presence: true
end
