require "csv"

CSV.foreach('db/csv/tours.csv', headers: true) do |row|
  Tour.find_or_create_by!(name: row['name']) do |tour|
    tour.name = row['name']
    tour.name_kana_ruby = row['name_kana_ruby']
  end
end

CSV.foreach('db/csv/events.csv', headers: true) do |row|
  Event.find_or_create_by!(name: row['name'], date: row['date']) do |event|
    event.category = row['category']
    event.name = row['name']
    event.name_kana_ruby = row['name_kana_ruby']
    event.date = row['date']
    event.place = row['place']
    event.place_prefecture = row['place_prefecture']
    event.is_canceled = row['is_canceled']
    event.remark = row['remark']
    event.tour_id = row['tour_id']
  end
end

CSV.foreach('db/csv/songs.csv', headers: true) do |row|
  Song.find_or_create_by!(name: row['name']) do |song|
    song.name = row['name']
    song.name_kana_ruby = row['name_kana_ruby']
    song.youtube_link = row['youtube']
    song.name_hiragana_ruby = row['name_hiragana_ruby']
  end
end
