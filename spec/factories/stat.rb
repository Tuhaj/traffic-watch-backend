FactoryGirl.define do
  factory :stat do
    created_at Time.now - 1.day
    weighted_mean '1467'
  end
end