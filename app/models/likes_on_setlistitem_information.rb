class LikesOnSetlistitemInformation < ApplicationRecord
  belongs_to :user
  belongs_to :setlistitem_information

  has_many :notices, as: :noticeable, dependent: :destroy
end
