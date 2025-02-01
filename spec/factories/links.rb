FactoryBot.define do
  factory :link do
    texts = ("a".."z").to_a
    link_prefixes = %w(https://www.youtube.com/watch?v= https://www.tiktok.com/)

    platform {"YouTube"}
    sequence(:url_link) { |n|
      link_prefixes.sample + texts.sample(2 + (n % 4)).join
    }
    sequence(:remark) { |n|
      texts.sample(2 + (n % 4)).join
    }
    sequence(:title) { |n|
      texts.sample(2 + (n % 4)).join
    }
  end
end
