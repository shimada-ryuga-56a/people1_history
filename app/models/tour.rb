class Tour < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :tour_informations, dependent: :destroy

  validates :name, presence: true
  validates :name_kana_ruby, presence: true
end
