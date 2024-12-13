class LinkContent < ApplicationRecord
  belongs_to :linkable, polymorphic: true
  belongs_to :link
end
