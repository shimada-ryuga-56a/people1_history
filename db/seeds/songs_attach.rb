require "csv"

CSV.foreach('db/csv/songs.csv', headers: true) do |row|
  song = Song.find_by(name: row['name'])
  if song.jk.attached?
    return
  end
  song.jk.attach(io: File.open(Rails.root.join(row['jk'])),filename: File.basename(row['jk']))
end
