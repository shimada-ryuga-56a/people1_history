class History < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :title, presence: true
  validates :remark, presence: true
  validates :date, presence: true
end
