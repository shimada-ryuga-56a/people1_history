class Disc < ApplicationRecord
  has_many :disc_versions, dependent: :destroy
  has_many :informations, as: :reportable, dependent: :destroy
  has_many :link_contents, as: :linkable, dependent: :destroy

  validates :title, presence: true
  validates :title_ruby, presence: true
  validates :release_date, presence: true
  validates :production_type, presence: true

  enum :production_type, { single: 0, ep: 1, album: 2, movie: 3 }

  def date_inspection(another_date)
    if respond_to?('announcement_date')
      announcement_date != another_date
    elsif respond_to?('release_date')
      release_date != another_date
    end
  end

  def about_date
    if respond_to?('announcement_date')
      announcement_date
    elsif respond_to?('release_date')
      release_date
    end
  end

  def release_date?
    respond_to?('release_date')
  end
end
