class Notice < ApplicationRecord
  belongs_to :noticeable, polymorphic: true
  belongs_to :user
end
