FactoryBot.define do
  password = Faker::Internet.password(min_length: 6, max_length: 8)

  factory :user do
    email { Faker::Internet.email } #=> "eliza@mann.net"
    password { password }
    password_confirmation { password }
    last_name { Faker::Lorem.characters(number: 5) } #=> 5文字生成
    first_name { Faker::Lorem.characters(number: 5) } #=> 5文字生成
    nickname { Faker::Lorem.characters(number: 5) } #=> 5文字生成
    introduction { Faker::Lorem.characters(number: 30) } #=> 30文字生成
    is_deleted { false } #=> boolen型
  end
end
