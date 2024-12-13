class Link < ApplicationRecord
  validates :platform, presence: true
  validates :url_link, presence: true
  validates :remark, presence: true

  enum :platform, { YouTube: 0, YouTubeMusic: 1, AppleMusic: 2, Spotify: 3, TikTok: 4, X: 5 }
end
