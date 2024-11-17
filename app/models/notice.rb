class Notice < ApplicationRecord
  belongs_to :noticeable, polymorphic: true
  belongs_to :user

  enum :action_type, { liked: 0, commented: 1 }
end
