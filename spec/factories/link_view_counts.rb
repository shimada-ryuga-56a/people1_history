FactoryBot.define do
  factory :link_view_count do
    association :link
    date { Time.zone.today }
    view_count { 1_000_000 }
    link_id { link.id }
  end

  factory :correct_link_view_count, class: LinkViewCount do
    association :link
    date { Time.zone.today }
    view_count { 1_000_000 }
    link_id { link.id }
  end

  factory :previous_link_view_count, class: LinkViewCount do
    association :link
    date { 20_250_201 }
    view_count { 1_000_000 }
    link_id { link.id }
  end

  factory :now_same_million_link_view_count, class: LinkViewCount do
    association :link
    date { 20_250_202 }
    view_count { 1_500_000 }
    link_id { link.id }
  end

  factory :next_million_link_view_count, class: LinkViewCount do
    association :link
    date { 20_250_203 }
    view_count { 2_000_000 }
    link_id { link.id }
  end
end
