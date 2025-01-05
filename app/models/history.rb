class History < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :informations, as: :reportable, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy

  validates :title, presence: true
  validates :date, presence: true
  validates :image, image: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "informations", "likes", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "id", "id_value", "remark", "title", "updated_at", "user_id"]
  end

  def remove_image
    @remove_image || false
  end

  def remove_image=(value)
    attribute_will_change!('remove_image') if remove_image != value
    @remove_image = value
  end
end
