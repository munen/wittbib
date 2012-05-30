# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name "MyString"
    street "MyString"
    phone "MyString"
    district "MyString"
    email "MyString"
    is_library_visitor false
  end
end
