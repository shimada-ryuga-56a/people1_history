class ImageValidator < ActiveModel::EachValidator
  def validate_each(record, _attribute, value)
    return if value.blank?

    record.errors.add(:image, :invalid_format) unless allowed_content_types.include?(value.content_type)

    return unless value.byte_size > max_file_size

    record.errors.add(:image, :too_big_size)
  end

  private

  def allowed_content_types
    ['image/jpeg', 'image/jpg', 'image/png']
  end

  def max_file_size
    510_241_024
  end
end
