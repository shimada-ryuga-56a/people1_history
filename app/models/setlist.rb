class Setlist < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :setlistitems, dependent: :destroy

  accepts_nested_attributes_for :setlistitems, allow_destroy: true, reject_if: :all_blank
end
