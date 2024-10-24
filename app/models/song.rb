class Song < ApplicationRecord
  has_many :song_informations, dependent: :destroy
end
