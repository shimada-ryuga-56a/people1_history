class Song < ApplicationRecord
  has_many :song_informations, dependent: :destroy
  has_one_attached :jk
end
