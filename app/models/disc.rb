class Disc < ApplicationRecord
  validates :title, presence: true
  validates :title_ruby, presence: true
  validates :announcement_date, presence: true
  validates :type, presence: true

  enum :type, { single: 0, ep: 1, album: 2, movie: 3 }
end
