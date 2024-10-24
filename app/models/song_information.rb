class SongInformation < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates :body, presence: true
end
