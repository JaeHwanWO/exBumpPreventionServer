FactoryBot.define do
  factory :todo do
    myUUID { Faker::Lorem.word }
  end
end