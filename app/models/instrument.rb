class Instrument < ApplicationRecord
  belongs_to :member
  has_many :gears, dependent: :destroy
  accepts_nested_attributes_for :gears, allow_destroy: true

  enum :name, { vocal: 0, bass: 1, drums: 2, keyboard: 3, guitar: 4, sampler: 5, trumpet: 6, other: 20}

  validates :name, presence: true
end
