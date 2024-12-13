class Link < ApplicationRecord
  validates :platform, presence: true
  validates :url_link, presence: true
  validates :remark, presence: true

  enum :platform, { YouTube: 0, YouTubeMusic: 1, TikTok: 2, X: 3 }
end
