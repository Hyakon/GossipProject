# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p " ********************************* "
p " *                               * "
p " *         BEGIN OF SEED         * "
p " *                               * "
p " ********************************* "



p "Destroy curent data..."

p "Destroying City... #{City.count} "
City.destroy_all
p "Destroying JoinTag... #{JoinTag.count} "
JoinTag.destroy_all
p "Destroying JoinPm... #{JoinPm.count} "
JoinPm.destroy_all
p "Destroying Tag... #{Tag.count} "
Tag.destroy_all
p "Destroying PrivateMessage... #{PrivateMessage.count} "
PrivateMessage.destroy_all
p "Destroying Review... #{Review.count} "
Review.destroy_all
p "Destroying User... #{User.count} "
User.destroy_all
p "Destroying Gossip... #{Gossip.count} "
Gossip.destroy_all
p "-----------------------"
p "-----------------------"




10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.postcode
    )
end
puts "#{tp City.all}"
p "Creation Cities... #{City.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"



10.times do
  Tag.create!(
    title: Faker::Creature::Animal.name,
    )
end
puts "#{tp Tag.all}"
p "Creation Tags... #{Tag.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"



10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 10, to: 77),
    city_id: City.all.sample.id,
    password: "motdepasse"
    )
end
puts "#{tp User.all}"
p "Creation Users... #{User.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"



20.times do
  Gossip.create!(
    title: Faker::Movie.title,
    content: Faker::Movie.quote,
    user_id: User.all.sample.id
    )
end
puts "#{tp Gossip.all}"
p "Creation Potins... #{Gossip.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"



20.times do
  JoinTag.create!(
    gossip_id: Gossip.all.sample.id,
    tag_id: Tag.all.sample.id
    )
end
puts "#{tp JoinTag.all}"
p "Creation Join Tags... #{JoinTag.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"



10.times do
  PrivateMessage.create!(
    content: Faker::Lorem.paragraph,
    sender_id: User.all.sample.id
    )
end
puts "#{tp PrivateMessage.all}"
p "Creation Private Messages... #{PrivateMessage.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"



10.times do
  JoinPm.create!(
    user_id: User.all.sample.id,
    private_message_id: PrivateMessage.all.sample.id
    )
end
puts "#{tp JoinPm.all}"
p "Creation Join Pms... #{JoinPm.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"



100.times do
  Review.create!(
    content: Faker::Quote.famous_last_words,
    gossip_id: Gossip.all.sample.id,
    user_id: User.all.sample.id
    )
end
puts "#{tp Review.all}"
p "Creation Reviews... #{Review.count}"
puts "DONE"
p "-----------------------"
p "-----------------------"



p " ********************************* "
p " *                               * "
p " *          END OF SEED          * "
p " *                               * "
p " ********************************* "
