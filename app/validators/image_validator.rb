class ImageValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    p "デバッグ用、attribute：#{value.content_type}"
    return unless record.image.attached?

    unless ["image/jpeg", "image/jpg", "image/png", "image/heic"].include?(value.content_type)
      record.errors.add(:image, "が不正なサイズ形式です。")
    end

    if value.byte_size > 5_1024_1024
      record.errors.add(:image, "は5MB以内にしてください。")
    end
  end
end