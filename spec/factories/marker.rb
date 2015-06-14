FactoryGirl.define do
  factory :marker do
    lat '52.2220515'
    lng '21.2504114'
    time_without_traffic 800
    after(:create) do |marker|
      create(:sample, marker: marker)
    end
  end
end
