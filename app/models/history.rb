class History < ApplicationRecord
  belongs_to :user

  validates :body, presence: true
  validates :date, presence: true
end
