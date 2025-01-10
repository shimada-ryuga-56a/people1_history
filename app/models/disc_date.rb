class DiscDate < ApplicationRecord
  validates :date, presence: true
  validates :disc_id, presence: true
  validates :date_type, presence: true

  belongs_to :disc

  enum :date_type, { announcement: 0, release: 1, postponement: 2 }

  def self.ransackable_associations(auth_object = nil)
    ["disc"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "date_type", "disc_id", "id", "remark", "updated_at"]
  end
end
