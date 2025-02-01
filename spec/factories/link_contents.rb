FactoryBot.define do
  factory :link_content do
    link_id { 1 }
    linkable_id { 1 }
    linkable_type { 'Song' }
  end
end
