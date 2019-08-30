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

ActiveRecord::Schema.define(version: 2019_08_30_153411) do


  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.integer "coordinate_id"
    t.index ["coordinate_id"], name: "index_cities_on_coordinate_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.integer "phone", limit: 15
    t.string "address"
    t.integer "unique_identifier_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coordinates", force: :cascade do |t|
    t.decimal "latitude", null: false
    t.decimal "longitude", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer "physical_item_id"
    t.date "burrow_date", null: false
    t.date "return_date", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.index ["client_id"], name: "index_loans_on_client_id"
    t.index ["physical_item_id"], name: "index_loans_on_physical_item_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "alternative_contact"
    t.integer "coordinate_id"
    t.integer "city_id"
    t.index ["city_id"], name: "index_locations_on_city_id"
    t.index ["coordinate_id"], name: "index_locations_on_coordinate_id"
  end

  create_table "physical_items", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.integer "location_id"
    t.index ["item_id"], name: "index_physical_items_on_item_id"
    t.index ["location_id"], name: "index_physical_items_on_location_id"
  end

  create_table "physical_videos", force: :cascade do |t|
    t.integer "physical_item_id"
    t.boolean "is_3d", default: false
    t.string "format"
    t.string "resolution"
    t.string "sound"
    t.text "other_information"
    t.string "dubbed"
    t.index ["physical_item_id"], name: "index_physical_videos_on_physical_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.integer "city_id"
    t.integer "client_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["client_id"], name: "index_users_on_client_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.integer "item_id"
    t.integer "year", null: false
    t.date "released", null: false
    t.string "director", null: false
    t.string "actors", null: false
    t.string "writer", null: false
    t.string "genres", null: false
    t.string "category", null: false
    t.string "awards", null: false
    t.string "rated", null: false
    t.decimal "imdb_rating", null: false
    t.string "imdb_url", null: false
    t.string "trailer_url"
    t.string "poster_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language"
    t.index ["item_id"], name: "index_videos_on_item_id"
  end

end
