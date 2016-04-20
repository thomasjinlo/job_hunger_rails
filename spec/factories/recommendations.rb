FactoryGirl.define do
  factory :recommendation do
    start_date DateTime.now
    action "write an email"
    recommendable = Lead.new
    recommendable_type "lead"
    recommendable_id = 99
    completed false
    user
  end
end
