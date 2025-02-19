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

  factory :link_youtube, class: Link do
    url_link { link_prefixes[0] + texts.sample(2).join }
    platform { 'YouTube' }
    remark { texts.sample(2).join }
    title { texts.sample(2).join }
  end

  factory :link_tiktok, class: Link do
    url_link { link_prefixes[1] + texts.sample(2).join }
    platform { 'TikTok' }
    remark { texts.sample(2).join }
    title { texts.sample(2).join }
  end
end
