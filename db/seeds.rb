10.times do
  Tutorial.create({
    user_id: 1,
    title: Faker::Lorem.words(num = 20),
    description: Faker::Lorem.words(num = 20),
    category: "computer",
    })
end
