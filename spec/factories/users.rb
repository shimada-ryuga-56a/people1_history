FactoryBot.define do
  factory :x_user do
		email {"rspec_test@test.com"}
		uid {"123"}
		provider {"twitter"}
		name {"anonymous"}
		confirmed_at {Time.now}
  end

  factory :x_user2, class: User do
    email {"rspec_test2@test.com"}
    uid {"456"}
    provider {"twitter"}
    name {"anonymous2"}
    confirmed_at {Time.now}
  end

  factory :correct_x_user, class: User do
		email {"rspec_test@test.com"}
		uid {"123"}
		provider {"twitter"}
		name {"anonymous"}
		confirmed_at {Time.now}
  end

  factory :no_email_x_user, class: User do
    uid {"123"}
    provider {"twitter"}
    name {"anonymous"}
    confirmed_at {Time.now}
  end
end
