class MemberInformation < ApplicationRecord
  belongs_to :member
  belongs_to :user

  has_rich_text :content
  validates :content, presence: true
end
