class Link < ApplicationRecord
  has_many :link_contents, dependent: :destroy

  validates :platform, presence: true
  validates :url_link, presence: true
  validates :remark, presence: true

  enum :platform, { YouTube: 0, YouTubeMusic: 1, TikTok: 2, X: 3 }

  def self.ransackable_associations(_auth_object = nil)
    %w[link_contents]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value platform remark updated_at url_link]
  end
end
