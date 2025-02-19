FactoryBot.define do
  texts = ('a'..'z').to_a
  link_prefixes = %w[https://www.youtube.com/watch?v= https://www.tiktok.com/]

  factory :link do
    sequence(:url_link) do |n|
      link_prefixes.sample + texts.sample(2 + (n % 4)).join
    end
    platform { url_link.include?('youtube') ? 'YouTube' : 'TikTok' }
    sequence(:remark) do |n|
      texts.sample(2 + (n % 4)).join
    end
    sequence(:title) do |n|
      texts.sample(2 + (n % 4)).join
    end
  end
end
