FactoryBot.define do
  factory :event, class: Event do
    category { Event.categories.keys.sample }
    name { "イベント名" }
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    name_kana_ruby { "イベントメイ" }
    is_canceled { false }
    place { "イベント会場" }
    place_prefecture { Event.place_prefectures.keys.sample }
    remark { "備考文" }
    # if category == "Tour"
    #   association :tour, factory: :tour
    # end

    after(:build) do |event|
      event.visual_image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end

  factory :correct_event, class: Event do
    category { Event.categories.keys.sample }
    name { "イベント名" }
    date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    name_kana_ruby { "イベントメイ" }
    is_canceled { false }
    place { "イベント会場" }
    place_prefecture { Event.place_prefectures.keys.sample }
    remark { "備考文" }
    # if category == "Tour"
    #   association :tour, factory: :tour
    # end

    after(:build) do |event|
      event.visual_image.attach(
        io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
  end
end