class Song < ApplicationRecord
  has_many :song_informations, dependent: :destroy
  has_one_attached :jk

  with_options presence: true do
    validates :name_hiragana_ruby, format: { with: /^[ぁ-んー－]+$/, message: "全角カタカナで入力して下さい" }
    validates :name_kana_ruby, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力して下さい" }
  end
end
