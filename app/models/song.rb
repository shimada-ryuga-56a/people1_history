class Song < ApplicationRecord
  has_many :song_informations, dependent: :destroy
  has_many :disc_items, dependent: :destroy
  has_one_attached :jk

  with_options presence: true do
    validates :name_hiragana_ruby, format: { with: /\A[ぁ-んー－]+\z/, message: I18n.t('model.song.validates.hiragana_ruby') }
    validates :name_kana_ruby, format: { with: /\A[ァ-ヶー－]+\z/, message: I18n.t('model.song.validates.kana_ruby') }
  end
end
