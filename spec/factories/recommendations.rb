FactoryGirl.define do
  factory :recommendation do
    start_date DateTime.now
    complete false
  end
end
