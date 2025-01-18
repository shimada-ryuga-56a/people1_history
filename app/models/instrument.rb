class Instrument < ApplicationRecord
  belongs_to :member
  has_many :gears, dependent: :destroy
  accepts_nested_attributes_for :gears, allow_destroy: true

  enum :name, { guitar: 0, bass: 1, drums: 2, keyboard: 3, vocal: 4, other: 5 }

  validates :name, presence: true
end
