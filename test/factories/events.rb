FactoryBot.define do
  factory :event do
    id { 1 }
    category { 1 }
    name { 'MyText' }
    name_kana_ruby { 'テスト' }
    date { '2024-01-01' }
  end
end
