class LikesOnSetlistitemInformation < ApplicationRecord
  belongs_to :user
  belongs_to :setlistitem_information
end
