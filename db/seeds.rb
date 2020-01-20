# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


28.times do
  Musician.create(name: Faker::Name.unique.name, city: Faker::Address.city, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, instrument: Faker::Music.instrument)
end

10.times do
  Rehearsal.create(location: 'Studio 9030', city: Faker::Address.city, purpose: "New Material", date: Faker::Date.between(from: 1.years.ago, to: Date.today), time: Faker::Time.forward(days: 180, period: :evening))
  Rehearsal.create(location: 'BoomBah', city: Faker::Address.city, purpose: "New Musician", date: Faker::Date.forward(days: 180), time: Faker::Time.forward(days: 180, period: :evening))
  Rehearsal.create(location: 'Toast', city: Faker::Address.city, purpose: "Special Event", date: Faker::Date.between(from: 1.years.ago, to: Date.today), time: Faker::Time.forward(days: 180, period: :evening))
  Rehearsal.create(location: 'Northern Stars', city: Faker::Address.city, purpose: "Venue setup", date: Faker::Date.forward(days: 180), time: Faker::Time.forward(days: 180, period: :evening))

end


# Rehearsal.all.each_with_index do |rehearsal, i|
#   rehearsal.students << [Student.limit(8).offset(i*2)]
# end