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

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "disc_content_id", "id", "id_value", "is_arranged", "position", "song_id", "title", "updated_at"]
  end
end
