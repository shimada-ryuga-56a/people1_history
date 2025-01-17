class Gear < ApplicationRecord
  validates :name, presence: true

  has_one_attached :image

  belongs_to :instrument
end
