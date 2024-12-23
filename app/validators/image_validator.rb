class ImageValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    unless ["image/jpeg", "image/jpg", "image/png"].include?(value.content_type)
      record.errors.add(:image, :invalid_format)
    end

    if value.byte_size > 5_1024_1024
      record.errors.add(:image, :too_big_size)
    end
  end
end