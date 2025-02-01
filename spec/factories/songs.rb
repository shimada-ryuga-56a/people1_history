FactoryBot.define do
  factory :song do
    hiragana_texts = ('あ'..'ん').to_a
    katakana_texts = ('ア'..'ン').to_a

    sequence(:name) { |n| "title_#{n}" }
    sequence(:name_hiragana_ruby) do |n|
      hiragana_texts.sample(2 + (n % 4)).join
    end
    sequence(:name_kana_ruby) do |n|
      katakana_texts.sample(2 + (n % 4)).join
    end
  end
end
