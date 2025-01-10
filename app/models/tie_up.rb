class TieUp < ApplicationRecord
  belongs_to :song

  validates :collaboration_title, presence: true
  validates :song_id, presence: true
  validates :announce_date, presence: true

  has_one_attached :image

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "song"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["announce_date", "collaboration_title", "created_at", "id", "remark", "song_id", "updated_at"]
  end
end
