# CSV.foreach('db/csv/tours.csv', headers: true) do |row|
#   Tour.create!(
#     name: row['name'],
#     name_kana_ruby: row['name_kana_ruby']
#   )
# end

# CSV.foreach('db/csv/events.csv', headers: true) do |row|
#   Event.create!(
#     category: row['category'],
#     name: row['name'],
#     name_kana_ruby: row['name_kana_ruby'],
#     date: row['date'],
#     place: row['place'],
#     place_prefecture: row['place_prefecture'],
#     is_canceled: row['is_canceled'],
#     remark: row['remark'],
#     tour_id: row['tour_id']
#   )
# end