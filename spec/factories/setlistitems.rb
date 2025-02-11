FactoryBot.define do
  factory :setlistitem do
    song_title { 'song_title' }
  end

  factory :correct_setlistitem, class: Setlistitem do
    song_title { 'song_title' }
  end

  factory :rehearsal_setlistitem, class; Setlistitem do
    song_title { 'song_title' }
    is_rehearsal { true }
  end

  factory :encore_setlistitem, class: Setlistitem do
    song_title { 'song_title' }
    is_encore { true }
  end

  factory :not_song_setlistitem, class: Setlistitem do
    song_title { 'song_title' }
    is_song { false }
  end
end
