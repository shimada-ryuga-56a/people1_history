FactoryBot.define do
  hiragana_texts = ('あ'..'ん').to_a
  katakana_texts = ('ア'..'ン').to_a

  factory :song do
    sequence(:name) { |n| "title_#{n}" }
    sequence(:name_hiragana_ruby) do |n|
      hiragana_texts.sample(2 + (n % 4)).join
    end
    sequence(:name_kana_ruby) do |n|
      katakana_texts.sample(2 + (n % 4)).join
    end
  end

  factory :song1 do
    sequence(:name) { |n| "title_#{n}" }
    sequence(:name_hiragana_ruby) do |n|
      hiragana_texts.sample(2 + (n % 4)).join
    end
    sequence(:name_kana_ruby) do |n|
      katakana_texts.sample(2 + (n % 4)).join
    end
  end

  factory :song2, class: Song do
    sequence(:name) { |n| "title_#{n}" }
    sequence(:name_hiragana_ruby) do |n|
      hiragana_texts.sample(2 + (n % 4)).join
    end
    sequence(:name_kana_ruby) do |n|
      katakana_texts.sample(2 + (n % 4)).join
    end
  end

  factory :correct_song, class: Song do
    sequence(:name) { |n| "title_#{n}" }
    sequence(:name_hiragana_ruby) do |n|
      hiragana_texts.sample(2 + (n % 4)).join
    end
    sequence(:name_kana_ruby) do |n|
      katakana_texts.sample(2 + (n % 4)).join
    end
  end

  factory :no_name_song, class: Song do
    sequence(:name_hiragana_ruby) do |n|
      hiragana_texts.sample(2 + (n % 4)).join
    end
    sequence(:name_kana_ruby) do |n|
      katakana_texts.sample(2 + (n % 4)).join
    end
  end

  factory :no_name_hiragana_ruby_song, class: Song do
    sequence(:name) { |n| "title_#{n}" }
    sequence(:name_kana_ruby) do |n|
      katakana_texts.sample(2 + (n % 4)).join
    end
  end

  factory :incorrect_name_hiragana_ruby_song, class: Song do
    sequence(:name) { |n| "title_#{n}" }
    name_hiragana_ruby { 'アイウエオ' }
    sequence(:name_kana_ruby) do |n|
      katakana_texts.sample(2 + (n % 4)).join
    end
  end

  factory :no_name_kana_ruby_song, class: Song do
    sequence(:name) { |n| "title_#{n}" }
    sequence(:name_hiragana_ruby) do |n|
      hiragana_texts.sample(2 + (n % 4)).join
    end
  end

  factory :incorrect_name_kana_ruby_song, class: Song do
    sequence(:name) { |n| "title_#{n}" }
    sequence(:name_hiragana_ruby) do |n|
      hiragana_texts.sample(2 + (n % 4)).join
    end
    name_kana_ruby { 'あいうえお' }
  end
end
