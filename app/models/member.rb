class Member < ApplicationRecord
  validates :name, presence: true
  validates :name_ruby, presence: true
  validates :role, presence: true

  has_one_attached :image

  has_many :instruments, dependent: :destroy
  accepts_nested_attributes_for :instruments, allow_destroy: true

  enum :role, { guitar: 0, bass: 1, vocal: 2, drums: 3, keyboard: 4, sampler: 5, other: 6 }
  enum :blood_type, { a: 0, b: 1, o: 2, ab: 3 }
  enum :mbti, { istj: 0, isfj: 1, infj: 2, intj: 3, istp: 4, isfp: 5, infp: 6, intp: 7, estp: 8, esfp: 9, enfp: 10, entp: 11, estj: 12, esfj: 13, enfj: 14, entj: 15 }

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "instruments"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["birth_place", "birthday_day", "birthday_month", "birthday_year", "blood_type", "created_at", "id", "instagram", "mbti", "name", "name_ruby", "role", "thread", "updated_at", "x_link"]
  end
end
