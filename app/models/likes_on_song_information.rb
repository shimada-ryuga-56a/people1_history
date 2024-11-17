class LikesOnSongInformation < ApplicationRecord
  belongs_to :user
  belongs_to :song_information

  has_many :notices, as: :noticeable, dependent: :destroy
end
