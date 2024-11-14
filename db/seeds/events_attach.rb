require "csv"

CSV.foreach('db/csv/events.csv', headers: true) do |row|
  event = Event.find_by(name: row['name'], date: row['date'])
  if event.visual_image.attached?
    return
  end
  event.visual_image.attach(io: File.open(Rails.root.join(row['visual_image'])),filename: File.basename(row['visual_image']))
end
