class Instrument < ApplicationRecord
  belongs_to :member
  has_many :gears, dependent: :destroy
  accepts_nested_attributes_for :gears, allow_destroy: true

  validates :name, presence: true
end
