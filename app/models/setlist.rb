class Setlist < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :setlistitems, dependent: :destroy

  accepts_nested_attributes_for :setlistitems, allow_destroy: true, reject_if: :all_blank

  validate :at_least_one_setlistitem

  def at_least_one_setlistitem
    return unless setlistitems.none? { |item| item.song_title.present? }

    errors.add(:setlistitems, 'は1つ以上必要です')
  end
end
