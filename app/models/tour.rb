class Tour < ApplicationRecord
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, allow_destroy: true
  has_many :tour_informations, dependent: :destroy
  has_many :link_contents, as: :linkable, dependent: :destroy

  validates :name, presence: true
  validates :name_kana_ruby, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["events", "link_contents", "tour_informations"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "name_kana_ruby", "updated_at"]
  end
end
