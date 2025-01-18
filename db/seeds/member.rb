require "csv"

CSV.foreach('db/csv/members.csv', headers: true) do |row|
  Member.find_or_create_by!(name: row['name']) do |member|
    member.name = row['name']
    member.name_ruby = row['name_ruby']
    member.x_link = row['x']
    member.instagram = row['instagram']
    member.thread = row['thread']
    member.role = row['role']
    member.birthday_year = row['birthday_year']
    member.birthday_month = row['birthday_month']
    member.birthday_day = row['birthday_day']
    member.blood_type = row['blood_type']
    member.mbti = row['mbti']
    member.birth_place = row['birth_place']
  end
end