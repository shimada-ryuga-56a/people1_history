FactoryBot.define do
  factory :event_information do
    association :user
    association :event
    user_id { user.id }
    event_id { event.id }

    factory :correct_event_information, class: EventInformation do
      association :user
      association :event
      user_id { user.id }
      event_id { event.id }
      sequence(:body) { |_n| 'body' }
    end

    factory :no_body_event_information, class: EventInformation do
      association :user
      association :event
      user_id { user.id }
      event_id { event.id }
    end
  end
end
