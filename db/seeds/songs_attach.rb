require "csv"

CSV.foreach('db/csv/songs.csv', headers: true) do |row|
  song = Song.find_by(name: row['name'])
  if song.jk.attached?
    return
  end
  if row['jk'].present? && File.exist?(Rails.root.join(row['jk']))
    file = ImageProcessing::MiniMagick.source(File.open(Rails.root.join(row['jk']))).resize_to_fit(900, 900).call
    begin
    song.jk.attach(io: File.open(file.path),filename: File.basename(row['jk']))
    ensure
    file.close
    file.unlink
    end
  end
end
