# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tutorial do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence(word_count = 10) }
    category { Faker::Lorem.word }
    video { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'uploads', 'tutorial', 'video', '5', 'Responsive_Web_Design_with_Foundation_-_1.1._Introduction.mp4')) }
  
  end
end
