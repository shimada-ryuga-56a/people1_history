class DiscContent < ApplicationRecord
  belongs_to :disc_version
  belongs_to :event, optional: true
  has_many :disc_items, dependent: :destroy

  validates :content_type, presence: true

  enum :content_type, { songs: 0, events: 1, others: 2 }

  def self.ransackable_attributes(_auth_object = nil)
    %w[content_type created_at disc_version_id event_id id id_value updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[disc_items disc_version event]
  end
end
