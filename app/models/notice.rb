class Notice < ApplicationRecord
  belongs_to :noticeable, polymorphic: true
  belongs_to :user

  enum action_type: {
    like:  0
  }
end
