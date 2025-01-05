class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likable, polymorphic: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value likable_id likable_type updated_at user_id]
  end
end
