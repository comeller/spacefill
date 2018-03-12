# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "userfirst@gmail.com", password: "motdepasse")

 10.times do
  args_hash = {
    address: "16 villa Gaudelet, Paris",
    surface: 300,
    pallets: 50,
    description: "A great storage space in central Paris with professionnal services",
    public_price: 15000,
    food_grade_certified: true,
    alcohol_certified: false,
    frozen_certified: true,
    transportation_services: true,
    fullfilment_services: false,
    devaning_services: true,
  }

  warehouse = Warehouse.new(args_hash)
  warehouse.user = user
  warehouse.save

 end
