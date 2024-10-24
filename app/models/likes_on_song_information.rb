class LikesOnSongInformation < ApplicationRecord
  belongs_to :user
  belongs_to :song_information
end
