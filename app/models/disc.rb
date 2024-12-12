class Disc < ApplicationRecord
  has_many :disc_versions, dependent: :destroy
  has_many :informations, as: :reportable, dependent: :destroy

  validates :title, presence: true
  validates :title_ruby, presence: true
  validates :announcement_date, presence: true
  validates :production_type, presence: true

  enum :production_type, { single: 0, ep: 1, album: 2, movie: 3 }
end
