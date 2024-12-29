FactoryBot.define do
  factory :disc do
    id { 1 }
    title { 'MyText' }
    title_ruby { 'MyText' }
    production_type { 'single' }
    release_date { '2024-01-01' }
  end
end
