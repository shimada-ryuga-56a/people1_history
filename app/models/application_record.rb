class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.human_attribute_enum_value(attr_name, value)
    return if value.blank?

    human_attribute_name("#{attr_name}.#{value}")
  end

  def human_attribute_enum(attr_name)
    self.class.human_attribute_enum_value(attr_name, send(attr_name.to_s))
  end
end
