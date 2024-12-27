class History < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :informations, as: :reportable, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy

  validates :title, presence: true
  validates :date, presence: true
  validates :image, image: true
end
