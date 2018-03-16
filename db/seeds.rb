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

cities = ['Melun', 'Paris', 'Versailles', 'Velizy-Villacoublay', 'Metz', 'Nancy', 'Thionville','Verdun', 'Strasbourg', 'Bordeaux', "Vincennes", "Nanterre", "Créteil","Issy les Moulineaux", "Cergy", "Meaux", "Evry", "Aubervilliers" ]

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

 puts "DB well seeded"
