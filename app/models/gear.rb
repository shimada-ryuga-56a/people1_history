class Gear < ApplicationRecord
  validates :name, presence: true

  has_one_attached :image

  belongs_to :instrument

  def remove_image
    @remove_image || false
  end

  def remove_image=(value)
    attribute_will_change!('remove_image') if remove_image != value
    @remove_image = value
  end
end
