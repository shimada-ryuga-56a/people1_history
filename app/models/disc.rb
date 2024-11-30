class Disc < ApplicationRecord
  validates :title, presence: true
  validates :title_ruby, presence: true
  validates :announcement_date, presence: true
  validates :type, presence: true
end
