FactoryBot.define do
  factory :user do
    id { 1 }
    email { 'example@email.com' }
    encrypted_password { <%= Devise::Encryptor.digest(User, 'password') %> }
  end
end
