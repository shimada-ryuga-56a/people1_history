class LinkContent < ApplicationRecord
  belongs_to :linkable, polymorphic: true
  belongs_to :link

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "platform", "remark", "updated_at", "url_link"]
  end
end
