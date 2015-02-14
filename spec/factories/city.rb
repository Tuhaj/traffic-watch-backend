FactoryGirl.define do
  factory :city do
    name 'Warsaw'
    center '1,1'
    after(:create) do |city|
      create(:marker, city: city)
    end
  end
end