require 'faker'

puts "🌱 Seeding data..."

# Seed your database here
100.times do
    superheroes = Superheroes.create(
        name: Faker::Superhero.name,
        power: Faker::Superhero.power,
        hero_id: Faker::Number.between(from: 0, to: 100)
    )

    3.times do
        comment = Comment.create(
            body: Faker::Lorem.sentence,
            hero_id: superhero.id
        )
    end
end

puts "✅ Done seeding!"
