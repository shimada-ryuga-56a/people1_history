class Song < ApplicationRecord
  has_many :tie_ups, dependent: :destroy
  accepts_nested_attributes_for :tie_ups, allow_destroy: true

  has_many :song_informations, dependent: :destroy
  has_many :disc_items, dependent: :destroy
  has_many :link_contents, as: :linkable, dependent: :destroy

  has_many :links, through: :link_contents
  accepts_nested_attributes_for :link_contents, allow_destroy: true

  has_one_attached :jk

  with_options presence: true do
    validates :name_hiragana_ruby, format: { with: /\A[ぁ-んー－]+\z/, message: I18n.t('model.song.validates.hiragana_ruby') }
    validates :name_kana_ruby, format: { with: /\A[ァ-ヶー－]+\z/, message: I18n.t('model.song.validates.kana_ruby') }
  end
  validates :name, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[name name_kana_ruby name_hiragana_ruby]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[name name_kana_ruby name_hiragana_ruby]
  end
end
