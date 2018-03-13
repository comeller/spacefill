# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: "userfirst@gmail.com", password: "motdepasse")
user2 = User.create(email: "usersecond@gmail.com", password: "motdepasse")
user3 = User.create(email: "userthird@gmail.com", password: "motdepasse")
user4 = User.create(email: "userfourth@gmail.com", password: "motdepasse")


 20.times do
  args_hash = {
    address: Faker::Address.street_address + ', ' + Faker::Address.city,
    surface: rand(100..500),
    pallets: rand(30..200),
    description: Faker::Lorem.paragraph(6),
    public_price: rand(500..1500),
    food_grade_certified: [true, false].sample,
    alcohol_certified: [true, false].sample,
    frozen_certified: [true, false].sample,
    transportation_services: [true, false].sample,
    fullfilment_services: [true, false].sample,
    devaning_services: [true, false].sample,
  }

  warehouse = Warehouse.new(args_hash)
  warehouse.user = [user1, user2, user3, user4].sample
  warehouse.save

 end

