require "csv"

CSV.foreach('db/csv/discs announcement_date update.csv', headers: true) do |row|
  disc = Disc.find_by(id: row['id'])
  disc.announcement_date = nil
  disc.save
end

CSV.foreach('db/csv/songs announcement_date update.csv', headers: true) do |row|
  song = Song.find_by(id: row['song_id'])
  song.announcement_date = row['announcement_date']
  song.save
end