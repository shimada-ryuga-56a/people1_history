FactoryBot.define do
  factory :setlist do
    association :event
    association :user
    user_id { user.id }
    event_id { event.id }
    after(:build) do |setlist|
      setlist.setlistitems << build(:setlistitem, setlist: setlist)
    end
  end

  factory :correct_setlist, class: Setlist do
    association :event
    association :user
    user_id { user.id }
    event_id { event.id }
    after(:build) do |setlist|
      setlist.setlistitems << build(:setlistitem, setlist: setlist)
    end
  end

  factory :no_setlistitems_setlist, class: Setlist do
    association :event
    association :user
    user_id { user.id }
    event_id { event.id }
  end

  factory :no_event_setlist, class: Setlist do
    association :user
    user_id { user.id }
  end

  factory :no_user_setlist, class: Setlist do
    association :event
    event_id { event.id }
  end
end
