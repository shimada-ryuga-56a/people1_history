FactoryBot.define do
  factory :setlistitem do
    association :setlist
    setlist_id { setlist.id }
    song_title { 'song_title' }
  end

  factory :setlistitem_with_song, class: Setlistitem do
    association :setlist
    association :song
    setlist_id { setlist.id }
    song_id { song.id }
    song_title { song.name }
  end

  factory :correct_setlistitem, class: Setlistitem do
    association :setlist
    setlist_id { setlist.id }
    song_title { 'song_title' }
  end

  factory :rehearsal_setlistitem, class: Setlistitem do
    association :setlist
    setlist_id { setlist.id }
    song_title { 'song_title' }
    is_rehearsal { true }
  end

  factory :encore_setlistitem, class: Setlistitem do
    association :setlist
    setlist_id { setlist.id }
    song_title { 'song_title' }
    is_encore { true }
  end

  factory :not_song_setlistitem, class: Setlistitem do
    association :setlist
    setlist_id { setlist.id }
    song_title { 'song_title' }
    is_song { false }
  end
end
