FactoryBot.define do
  factory :link_view do
    association :link
    date { Date.today }
    link_id { link.id }
    record_type { :one_million }
  end

  factory :correct_link_view, class: LinkView do
    association :link
    date { Date.today }
    link_id { link.id }
    record_type { :one_million }
  end
end
