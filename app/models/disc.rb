class Disc < ApplicationRecord
  has_many :disc_versions, dependent: :destroy

  validates :title, presence: true
  validates :title_ruby, presence: true
  validates :announcement_date, presence: true
  validates :production_type, presence: true
  validate :required_either_song_or_title

  enum :production_type, { single: 0, ep: 1, album: 2, movie: 3 }

  private

  def required_either_song_or_title
    nil if song_id.present? ^ title.present?
  end
end
