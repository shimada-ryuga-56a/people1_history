class DiscItem < ApplicationRecord
  belongs_to :disc_content
  belongs_to :song, optional: true

  validates :position, presence: true
  validates :is_arranged, inclusion: { in: [true, false] }
  validate :required_either_song_or_title

  private

  def required_either_song_or_title
    nil if song_id.present? ^ title.present?
  end
end
