# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180315162251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "warehouse_id"
    t.date "start_date"
    t.date "end_date"
    t.text "customer_request"
    t.float "booking_price"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "booked_pallets"
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["warehouse_id"], name: "index_bookings_on_warehouse_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company"
    t.string "phone_number"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address"
    t.integer "surface"
    t.integer "pallets"
    t.text "description"
    t.integer "public_price"
    t.boolean "food_grade_certified", default: false
    t.boolean "frozen_certified", default: false
    t.boolean "alcohol_certified", default: false
    t.boolean "fulfillment_services", default: false
    t.boolean "transportation_services", default: false
    t.boolean "devanning_services", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
    t.index ["user_id"], name: "index_warehouses_on_user_id"
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "warehouses"
  add_foreign_key "warehouses", "users"
end
