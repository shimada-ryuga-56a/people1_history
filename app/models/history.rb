class History < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :body, presence: true
  validates :date, presence: true
end
