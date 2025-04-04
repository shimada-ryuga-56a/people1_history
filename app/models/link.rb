class Link < ApplicationRecord
  has_many :link_contents, dependent: :destroy
  has_many :links, dependent: :destroy, through: :link_contents
  has_many :link_dates, dependent: :destroy
  accepts_nested_attributes_for :link_dates, allow_destroy: true

  has_many :link_views, dependent: :destroy
  accepts_nested_attributes_for :link_views, allow_destroy: true

  has_many :link_view_counts, dependent: :destroy
  accepts_nested_attributes_for :link_view_counts, allow_destroy: true

  validates :platform, presence: true
  validates :url_link, presence: true
  validates :remark, presence: true

  enum :platform, { YouTube: 0, YouTubeMusic: 1, TikTok: 2, X: 3 }

  def self.ransackable_associations(_auth_object = nil)
    ['link_contents']
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value platform remark updated_at url_link]
  end

  def extract_youtube_id
    if url_link.include?('https://youtu.be/')
      url_link.gsub(%r{https://youtu.be/}, '').gsub(/\?si=.*/, '')
    else
      url_link.gsub('https://www.youtube.com/watch?v=', '')
    end
  end
end
