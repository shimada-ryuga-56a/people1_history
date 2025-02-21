# require "csv"

# CSV.foreach('db/csv/tours.csv', headers: true) do |row|
#   Tour.find_or_create_by!(name: row['name']) do |tour|
#     tour.name = row['name']
#     tour.name_kana_ruby = row['name_kana_ruby']
#   end
# end

# CSV.foreach('db/csv/events.csv', headers: true) do |row|
#   Event.find_or_create_by!(name: row['name'], date: row['date']) do |event|
#     event.category = row['category']
#     event.name = row['name']
#     event.name_kana_ruby = row['name_kana_ruby']
#     event.date = row['date']
#     event.place = row['place']
#     event.place_prefecture = row['place_prefecture']
#     event.is_canceled = row['is_canceled']
#     event.remark = row['remark']
#     event.tour_id = row['tour_id']
#     if row['visual_image'].present? && File.exist?(Rails.root.join(row['visual_image']))
#       file = ImageProcessing::MiniMagick.source(File.open(Rails.root.join(row['visual_image']))).resize_to_fit(900, 900).call
#       begin
#       event.visual_image.attach(io: File.open(file.path),filename: File.basename(row['visual_image']))
#       ensure
#       file.close
#       file.unlink
#       end
#     end
#   end
# end

# CSV.foreach('db/csv/songs.csv', headers: true) do |row|
#   Song.find_or_create_by!(name: row['name']) do |song|
#     song.name = row['name']
#     song.name_kana_ruby = row['name_kana_ruby']
#     song.youtube_link = row['youtube']
#     if row['jk'].present? && File.exist?(Rails.root.join(row['jk']))
#       file = ImageProcessing::MiniMagick.source(File.open(Rails.root.join(row['jk']))).resize_to_fit(900, 900).call
#       begin
#       song.jk.attach(io: File.open(file.path),filename: File.basename(row['jk']))
#       ensure
#       file.close
#       file.unlink
#       end
#     end
#   end
# end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?