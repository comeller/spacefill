Booking.destroy_all
Warehouse.destroy_all
User.destroy_all

user1 = User.create(email: "userfirst@gmail.com", password: "motdepasse")
user2 = User.create(email: "usersecond@gmail.com", password: "motdepasse")
user3 = User.create(email: "userthird@gmail.com", password: "motdepasse")

user1.remote_photo_url = "https://res.cloudinary.com/dixy9tipv/image/upload/v1520958309/wozlfc0ypqwwsi9npaia.png"
user2.remote_photo_url = "https://res.cloudinary.com/dixy9tipv/image/upload/v1520958292/iiadhxkv2z6f3xypw92v.jpg"
user3.remote_photo_url = "https://res.cloudinary.com/dixy9tipv/image/upload/v1520958275/zdoeone2bug1s2v6dgn1.png"

user1.save
user2.save
user3.save

urls = [
"http://res.cloudinary.com/dixy9tipv/image/upload/v1521133660/vlhujbvuvarairgoq02p.jpg",
"http://res.cloudinary.com/dixy9tipv/image/upload/v1521133659/xp5ppalrcvdgucyy2dpc.jpg",
"http://res.cloudinary.com/dixy9tipv/image/upload/v1521133656/okr6ked7gpyfbs2lncrx.jpg"
]

cities = ['Melun', 'Paris', 'Versailles', 'Velizy-Villacoublay', 'Metz', 'Nancy', 'Thionville','Verdun', 'Strasbourg', 'Bordeaux', "Asnières sur seine", "Nanterre", "Créteil","Issy les Moulineaux", "Cergy", "Meaux", "Evry" ]

# BOOKINGS CREATION
requests = ["We are a small company, we would need transportation once a week",
  "We need ultra low temperature to store our products",
  "Your space seems perfect for us, very simple need"
]

statuses = ["pending", "approved", "refused"]
# -------------

10.times do
  args_hash = {
    surface: rand(100..500),
    pallets: rand(30..200),
    description: Faker::Lorem.paragraph(6),
    public_price: rand(9..15),
    food_grade_certified: [true, false].sample,
    alcohol_certified: [true, false].sample,
    frozen_certified: [true, false].sample,
    transportation_services: [true, false].sample,
    fulfillment_services: [true, false].sample,
    devanning_services: [true, false].sample,
  }

  warehouse = Warehouse.new(args_hash)
  user = [user1, user2, user3].sample
  warehouse.user = user
  warehouse.address = cities.sample
  cities.delete(warehouse.address)
  warehouse.remote_photo_url = urls.sample
  warehouse.save

  3.times do
    booking_hash = {
      customer_request: requests.sample,
      status: statuses.sample,
      booked_pallets: rand(30..200),
    }
    booking = Booking.new(booking_hash)
    booking.warehouse = warehouse
    booking.user = user
    booking.start_date = Faker::Date.between(Date.today, Date.new(2019,1,30))
    booking.save
  end
 end

puts "DB general well seeded"

#Seed pour le Demoday

# Create 2 users

paul = User.create(email: "paul@plateauxalsaciens.com", password: "motdepasse")
david = User.create(email: "david@gmail.com", password: "motdepasse")

# Create paul's warehouse + 3 bookings on it by David: 1 approved + 2 pending

warehouse_paul = Warehouse.new({
  surface: 3000,
  pallets: 3000,
  description: "Espace de stockage aux dernières normes",
  public_price: 12,
  food_grade_certified: true,
  alcohol_certified: true,
  frozen_certified: true,
  transportation_services: true,
  fulfillment_services: true,
  devanning_services: true,
  address: "Epinal"
  })
warehouse_paul.user = paul
warehouse_paul.remote_photo_url = urls.sample
warehouse_paul.save

book1 = Booking.new({
  customer_request: "A la recherche d'un entrepôt frigorifié",
  status: 'approved',
  booked_pallets: 1100,
  start_date: Date.today,
  })
book1.warehouse = warehouse_paul
book1.user = david
book1.save

book2 = Booking.new({
  customer_request: "J'ai besoin d'espace pour des vêtements",
  status: 'pending',
  booked_pallets: 600,
  start_date: Date.new(2018,6,15),
  })
book2.warehouse = warehouse_paul
book2.user = david
book2.save

 book3 = Booking.new({
  customer_request: "Je cherche un espace pour stocker des boissons alcoolisés",
  status: 'pending',
  booked_pallets: 1200,
  start_date: Date.new(2018,7,15),
  })
book3.warehouse = warehouse_paul
book3.user = david
book3.save

# Create david's 2 warehouses

warehouse_david = Warehouse.new({
  surface: 2000,
  pallets: 4000,
  description: "Stock tout partout",
  public_price: 14,
  food_grade_certified: true,
  alcohol_certified: true,
  frozen_certified: true,
  transportation_services: true,
  fulfillment_services: false,
  devanning_services: true,
  address: "Aubervilliers"
  })
warehouse_david.user = david
warehouse_david.remote_photo_url = "http://res.cloudinary.com/dixy9tipv/image/upload/v1521133659/xp5ppalrcvdgucyy2dpc.jpg"
warehouse_david.save

warehouse_david_bis = Warehouse.new({
  surface: 2000,
  pallets: 4000,
  description: "Stock tout partout",
  public_price: 14,
  food_grade_certified: true,
  alcohol_certified: true,
  frozen_certified: true,
  transportation_services: false,
  fulfillment_services: false,
  devanning_services: false,
  address: "Poissy"
  })
warehouse_david_bis.user = david
warehouse_david_bis.remote_photo_url = "http://res.cloudinary.com/dixy9tipv/image/upload/v1521133660/vlhujbvuvarairgoq02p.jpg"
warehouse_david_bis.save

# Create paul's 2 bookings: 1 refused sur bis + 1 pending sur david

book4 = Booking.new({
  customer_request: "J'ai besoin d'espace pour mes plateaux repas",
  status: 'refused',
  booked_pallets: 600,
  start_date: Date.new(2018,6,13),
  })
book4.warehouse = warehouse_david
book4.user = paul
book4.save

book5 = Booking.new({
  customer_request: "J'ai besoin d'espace pour mes plateaux repas",
  status: 'pending',
  booked_pallets: 600,
  start_date: Date.new(2018,6,13),
  })
book5.warehouse = warehouse_david_bis
book5.user = paul
book5.save

puts "Demoday well seeded"

