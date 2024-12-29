FactoryBot.define do
  factory :likes_on_tour_information do
    association :user
    association :tour_information
  end
end
