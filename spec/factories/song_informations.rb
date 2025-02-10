FactoryBot.define do
  factory :song_information do
    association :user
    association :song
    user_id { user.id }
    song_id { song.id }
    sequence(:body) { |_n| 'body' }
  end

  factory :correct_song_information, class: SongInformation do
    association :user
    association :song
    user_id { user.id }
    song_id { song.id }
    sequence(:body) { |_n| 'body' }
  end

  factory :no_body_song_information, class: SongInformation do
    association :user
    association :song
    user_id { user.id }
    song_id { song.id }
  end
end
