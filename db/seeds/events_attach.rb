require "csv"

CSV.foreach('db/csv/events.csv', headers: true) do |row|
  event = Event.find_by(name: row['name'], date: row['date'])
  if row['visual_image'].present? && File.exist?(Rails.root.join(row['visual_image']))
    file = ImageProcessing::MiniMagick.source(File.open(Rails.root.join(row['visual_image']))).resize_to_fit(900, 900).call
    begin
    event.visual_image.attach(io: File.open(file.path),filename: File.basename(row['visual_image']))
    ensure
    file.close
    file.unlink
    end
  end
end
