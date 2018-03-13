user1 = User.create(email: "userfirst@gmail.com", password: "motdepasse")
user2 = User.create(email: "usersecond@gmail.com", password: "motdepasse")
user3 = User.create(email: "userthird@gmail.com", password: "motdepasse")
user4 = User.create(email: "userfourth@gmail.com", password: "motdepasse")

url = ["https://www.tollgroup.com/sites/default/files/styles/open_graph_image/public/images/2017-10/0770_NikeWarehouse_s1%20this%20one.jpg?itok=IvtdjyEa",
"https://www.msdsonline.com/wp-content/uploads/warehouse.jpg",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRepmKU53XgqldC5s7x9xeVVJsOWhgXRcIMM9j0QMIska4UMRDB8w"
]

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
    fulfillment_services: [true, false].sample,
    devanning_services: [true, false].sample,
  }

  warehouse = Warehouse.new(args_hash)
  warehouse.user = [user1, user2, user3, user4].sample
  warehouse.remote_photo_url = url.sample
  warehouse.save

 end
