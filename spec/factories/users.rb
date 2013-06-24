# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'

    trait :profile do
      likes_spinach "true"
      would_hire_jeff "in a heartbeat"
    end
  end
end
