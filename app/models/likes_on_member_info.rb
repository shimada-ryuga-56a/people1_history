class LikesOnMemberInfo < ApplicationRecord
  belongs_to :member_information
  belongs_to :user
end
