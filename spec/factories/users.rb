FactoryBot.define do
  factory :user do
    email {"example@test.com"}
    uid { '123' }
    provider { 'twitter' }
    password { 'password12345' }
    name { 'anonymous' }
  end

  factory :user1 do
    email { 'rspec_test@test.com' }
    uid { '123' }
    provider { 'twitter' }
    password { 'password12345' }
    name { 'anonymous' }
  end

  factory :user2, class: User do
    email { 'rspec_test2@test.com' }
    uid { '456' }
    provider { 'twitter' }
    password { 'password12345' }
    name { 'anonymous2' }
  end

  factory :correct_x_user, class: User do
    sequence(:email) { |n| "x_test#{n}@example.com" }
    uid { '123' }
    provider { 'twitter' }
    password { 'password12345' }
    name { 'anonymous' }
  end

  factory :no_email_x_user, class: User do
    uid { '123' }
    provider { 'twitter' }
    password { 'password12345' }
    name { 'anonymous' }
  end
end
