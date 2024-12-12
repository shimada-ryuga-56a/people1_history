class Information < ApplicationRecord
  belongs_to :reportable, polymorphic: true
  belongs_to :user
  has_many :likes_on_informations, dependent: :destroy

  validates :body, presence: true
end
