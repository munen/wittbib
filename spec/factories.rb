# encoding: UTF-8
FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    password 'good_password'
  end

  factory :book do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:authors) { |n| "Author #{n}" }
  end

  factory :customer do
    sequence(:name) { |n| "Customer #{n}" }
  end

  factory :lending do
    association :book
    association :customer
    taken_at DateTime.now
  end
end

