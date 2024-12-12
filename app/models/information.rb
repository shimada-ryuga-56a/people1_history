class Information < ApplicationRecord
  belongs_to :reportable, polymorphic: true
  belongs_to :user

  validates :body, presence: true
end
