class LinkDate < ApplicationRecord
  belongs_to :link

  validates :date, presence: true
  validates :date_type, presence: true

  enum :date_type, { announcement: 0, release: 1, postponement: 2 }

  def self.ransackable_associations(auth_object = nil)
    ["link"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "date_type", "id", "link_id", "remark", "updated_at"]
  end

end
