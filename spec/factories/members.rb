FactoryBot.define do
  hiragana_texts = ('あ'..'ん').to_a
  katakana_texts = ('ア'..'ン').to_a

  factory :member do
    sequence(:name) { |n| "member_#{n}" }
    sequence(:name_ruby) do |n|
      hiragana_texts.sample(2 + (n % 4)).join
    end
    role { Member.roles.keys.sample }
  end
end
