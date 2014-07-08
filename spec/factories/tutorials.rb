# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tutorial do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence(word_count = 10) }
    category { Faker::Lorem.word }
  end
end
