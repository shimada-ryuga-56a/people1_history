FactoryBot.define do
  factory :song_information do
    id { 1 }
    song_id { 1 }
    user_id { 1 }
    body { 'test' }
  end
end
