FactoryBot.define do
  factory :history do
    association :user
    user_id { user.id }
    title { 'title' }
    date { '2021-01-01' }
    remark { 'remark' }
  end

  factory :correct_history, class: History do
    association :user
    user_id { user.id }
    title { 'title' }
    date { '2021-01-01' }
    remark { 'remark' }
  end

  factory :no_title_history, class: History do
    association :user
    user_id { user.id }
    date { '2021-01-01' }
    remark { 'remark' }
  end

  factory :no_date_history, class: History do
    association :user
    user_id { user.id }
    title { 'title' }
    remark { 'remark' }
  end
end
