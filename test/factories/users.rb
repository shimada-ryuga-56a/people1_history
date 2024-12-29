FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'example@email.com' }
    password { 'password' }
  end
end
