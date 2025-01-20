class MemberInformation < ApplicationRecord
  belongs_to :member
  belongs_to :user

  has_many :likes_on_member_infos, dependent: :destroy

  has_rich_text :content
  validates :content, presence: true
end
