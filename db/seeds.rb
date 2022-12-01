puts "🌱 Seeding data..."

100.times do
    superhero = Superhero.create(
        name: Faker::Superhero.name,
        power: Faker::Superhero.power
    )

    rand(1..5).times do
        Comment.create(
            text: Faker::Lorem.sentence,
            superhero_id: superhero.id
        )
    end
end

puts "✅ Done seeding!"
