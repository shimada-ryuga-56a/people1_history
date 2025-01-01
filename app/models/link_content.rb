class LinkContent < ApplicationRecord
  belongs_to :linkable, polymorphic: true
  belongs_to :link

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value platform remark updated_at url_link]
  end
end
