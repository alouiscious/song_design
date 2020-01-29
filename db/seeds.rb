# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Rehearsal.destroy_all
Song.destroy_all

10.times do 
  User.create(name: Faker::Name.unique.name, city: Faker::Address.city, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, instrument: Faker::Music.instrument, password: "testuser")
end

puts "#{User.count} users created" 

10.times do |i|
  User.all[i].organized_rehearsals.create(location: 'Studio 9030', city: Faker::Address.city, purpose: "New Material", date: Faker::Date.between(from: 1.years.ago, to: Date.today), time: Faker::Time.forward(days: 180, period: :evening))
  User.all[i].organized_rehearsals.create(location: 'BoomBah', city: Faker::Address.city, purpose: "New User", date: Faker::Date.forward(days: 180), time: Faker::Time.forward(days: 180, period: :evening))
  User.all[i].organized_rehearsals.create(location: 'Toast', city: Faker::Address.city, purpose: "Special Event", date: Faker::Date.between(from: 1.years.ago, to: Date.today), time: Faker::Time.forward(days: 180, period: :evening))
  User.all[i].organized_rehearsals.create(location: 'Northern Stars', city: Faker::Address.city, purpose: "Venue setup", date: Faker::Date.forward(days: 180), time: Faker::Time.forward(days: 180, period: :evening))
end

10.times do |i|
  User.all[i].songs.create(title: Faker::Beer.name, genre: Faker::Music.genre, key: Faker::Music.key, in_style_of: Faker::Music.band, status: 'true')
end


# Rehearsal.all.each_with_index do |rehearsal, i|
#   rehearsal.students << [Musician.limit(8).offset(i*2)]
# end