class DiscVersion < ApplicationRecord
  belongs_to :disc

  validates :version, presence: true

  enum :version, { streaming: 0, normal: 1, first_press_limited: 2, limited_product_edition: 3 }
end
