class Information < ApplicationRecord
  belongs_to :reportable, polymorphic: true
  belongs_to :user
  has_many :likes_on_informations, dependent: :destroy
  has_many :notices, as: :noticeable, dependent: :destroy

  validates :body, presence: true

  def liked_by?(user)
    likes_on_informations.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[body created_at id id_value reportable_id reportable_type updated_at user_id]
  end
end
