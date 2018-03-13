# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "userfirst@gmail.com", password: "motdepasse")
url = ["https://www.tollgroup.com/sites/default/files/styles/open_graph_image/public/images/2017-10/0770_NikeWarehouse_s1%20this%20one.jpg?itok=IvtdjyEa",
"https://www.msdsonline.com/wp-content/uploads/warehouse.jpg",
"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRepmKU53XgqldC5s7x9xeVVJsOWhgXRcIMM9j0QMIska4UMRDB8w"
]

  args_hash = {
    address: "1 Place de la Comédie, 69001 Lyon",
    surface: 300,
    pallets: 50,
    description: "A great storage space in central Paris with professionnal services",
    public_price: 15000,
    food_grade_certified: true,
    alcohol_certified: false,
    frozen_certified: true,
    transportation_services: true,
    fulfillment_services: false,
    devanning_services: true,
  }

  warehouse = Warehouse.new(args_hash)
  warehouse.user = user
  warehouse.remote_photo_url = url.sample
  warehouse.save
