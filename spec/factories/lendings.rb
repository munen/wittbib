# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lending do
    book_id 1
    customer_id 1
    taken_at "2012-05-31 08:34:14"
    returned_at "2012-05-31 08:34:14"
  end
end
