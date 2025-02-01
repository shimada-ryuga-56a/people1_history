FactoryBot.define do
  factory :link do
    texts = ("a".."z").to_a

    platform {"YouTube"}
    sequence(:url_link) { |n|
      "https://www.youtube.com/watch?v=" + texts.sample(2 + (n % 4)).join
    }
    sequence(:remark) { |n|
      texts.sample(2 + (n % 4)).join
    }
    sequence(:title) { |n|
      texts.sample(2 + (n % 4)).join
    }
  end
end
