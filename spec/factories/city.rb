FactoryGirl.define do
  factory :city do
    name 'Warsaw'
    center '52.2301036,21.0116003'
    after(:create) do |city|
      create(:marker, city: city)
      create(:stat,   city: city)
    end
  end
end
