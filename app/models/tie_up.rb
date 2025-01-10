class TieUp < ApplicationRecord
  belongs_to :song

  validates :collaboration_title, presence: true
  validates :announce_date, presence: true
  validates :is_new_song, inclusion: [true, false]

  has_one_attached :image

  def self.ransackable_associations(_auth_object = nil)
    %w[image_attachment image_blob song]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[announce_date collaboration_title created_at id remark song_id updated_at]
  end
end
