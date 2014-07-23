# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

25.Times do

  Tutorial.create({
    user_id: 1
    title: Faker::Ipsum.words(num = 20)
    description: Faker::Ipsum.words(num = 20)
    category: "computer"
    video: "/Users/landonwest/Desktop/Responsive_Web_Design_with_Foundation_-_1.1._Introduction.mp4"
    })

end
