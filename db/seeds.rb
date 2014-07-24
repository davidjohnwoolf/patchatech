# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  Tutorial.create({
    user_id: 1,
    title: Faker::Lorem.words(num = 20),
    description: Faker::Lorem.words(num = 20),
    category: "computer",
    })
end
