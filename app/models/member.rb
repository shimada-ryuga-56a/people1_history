class Member < ApplicationRecord
  validates :name, presence: true
  validates :name_ruby, presence: true
  validates :role, presence: true

  has_one_attached :image

  has_many :instruments, dependent: :destroy
  accepts_nested_attributes_for :instruments, allow_destroy: true

  has_many :member_informations, dependent: :destroy

  enum :role, { member: 0, support: 1, staff: 2 }
  enum :blood_type, { A: 0, B: 1, O: 2, AB: 3 }
  enum :mbti,
       { istj: 0, isfj: 1, infj: 2, intj: 3, istp: 4, isfp: 5, infp: 6, intp: 7, estp: 8, esfp: 9, enfp: 10, entp: 11, estj: 12,
         esfj: 13, enfj: 14, entj: 15 }
  enum :birth_place,
       { Hokkaido: 0, Aomori: 1, Iwate: 2, Miyagi: 3, Akita: 4, Yamagata: 5,
         Fukushima: 6, Ibaraki: 7, Tochigi: 8, Gunma: 9,
         Saitama: 10, Chiba: 11, Tokyo: 12, Kanagawa: 13, Niigata: 14,
         Toyama: 15, Ishikawa: 16, Fukui: 17, Yamanashi: 18, Nagano: 19,
         Gifu: 20, Shizuoka: 21, Aichi: 22, Mie: 23, Shiga: 24, Kyoto: 25,
         Osaka: 26, Hyogo: 27, Nara: 28, Wakayama: 29, Tottori: 30,
         Shimane: 31, Okayama: 32, Hiroshima: 33, Yamaguchi: 34, Tokushima: 35,
         Kagawa: 36, Ehime: 37, Kochi: 38, Fukuoka: 39, Saga: 40,
         Nagasaki: 41, Kumamoto: 42, Oita: 43, Miyazaki: 44, Kagoshima: 45,
         Okinawa: 46, other: 47 }

  def self.ransackable_associations(_auth_object = nil)
    %w[image_attachment image_blob instruments]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[birth_place birthday_day birthday_month birthday_year blood_type created_at id instagram mbti
       name name_ruby role thread updated_at x_link]
  end

  def remove_image
    @remove_image || false
  end

  def remove_image=(value)
    attribute_will_change!('remove_image') if remove_image != value
    @remove_image = value
  end
end
