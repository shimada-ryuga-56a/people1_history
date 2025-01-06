class Tour < ApplicationRecord
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, allow_destroy: true
  has_many :tour_informations, dependent: :destroy
  has_many :link_contents, as: :linkable, dependent: :destroy
  accepts_nested_attributes_for :link_contents, allow_destroy: true
  has_many :links, through: :link_contents

  validates :name, presence: true
  validates :name_kana_ruby, presence: true

  def self.ransackable_associations(_auth_object = nil)
    %w[events link_contents tour_informations]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value name name_kana_ruby updated_at]
  end
end
