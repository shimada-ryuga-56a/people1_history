class DiscVersion < ApplicationRecord
  belongs_to :disc
  has_many :disc_contents, dependent: :destroy
  has_one_attached :jacket

  validates :version, presence: true

  enum :version, { streaming: 0, normal: 1, first_press_limited: 2, limited_product_edition: 3, limited_time_edition: 4 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "disc_id", "id", "id_value", "price", "updated_at", "version"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["disc", "disc_contents", "jacket_attachment", "jacket_blob"]
  end

  def remove_jacket
    @remove_jacket || false
  end

  def remove_jacket=(value)
    attribute_will_change!('remove_jacket') if remove_jacket != value
    @remove_jacket = value
  end
end
