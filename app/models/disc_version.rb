class DiscVersion < ApplicationRecord
  belongs_to :disc
  has_many :disc_contents, dependent: :destroy
  has_one_attached :jacket

  validates :version, presence: true

  enum :version, { streaming: 0, normal: 1, first_press_limited: 2, limited_product_edition: 3, limited_time_edition: 4 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "disc_id", "id", "id_value", "price", "updated_at", "version"]
  end
end
