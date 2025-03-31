FactoryBot.define do
  numbers = ('0'..'9').to_a

  factory :admin_user do
    sequence(:email) { |n| "admin_#{numbers[n % numbers.length]}@example.com" }
    sequence(:password) { |n| "password_#{numbers[n % numbers.length]}" }
    sequence(:password_confirmation) { |n| "password_#{numbers[n % numbers.length]}" }
  end
end
