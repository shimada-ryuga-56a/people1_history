class DiscVersion < ApplicationRecord
  belongs_to :disc
  has_many :disc_contents, dependent: :destroy

  validates :version, presence: true

  enum :version, { streaming: 0, normal: 1, first_press_limited: 2, limited_product_edition: 3, limited_time_edition: 4 }
end
