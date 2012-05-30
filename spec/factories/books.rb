# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    author "MyString"
    title "MyString"
    isbn "MyString"
    description "MyText"
  end
end
