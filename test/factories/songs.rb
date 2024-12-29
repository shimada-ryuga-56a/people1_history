FactoryBot.define do
  factory :song do
    id { 1 }
    name { 'MyText' }
    name_kana_ruby { 'テスト' }
    name_hiragana_ruby { 'てすと' }
  end
end
