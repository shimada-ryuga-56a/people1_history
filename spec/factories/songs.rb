FactoryBot.define do
  factory :song do
    hiragana_texts = ("あ".."ん").to_a
    katakana_texts = ("ア".."ン").to_a

    sequence(:name) { |n| "title_#{n}" }
    sequence(:name_hiragana_ruby) { |n|
      hiragana_texts.sample(2 + (n % 4)).join
    }
    sequence(:name_kana_ruby) { |n|
      katakana_texts.sample(2 + (n % 4)).join
    }
  end
end
