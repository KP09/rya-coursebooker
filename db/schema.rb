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

ActiveRecord::Schema.define(version: 20170818082929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_admin_profiles_on_school_id"
    t.index ["user_id"], name: "index_admin_profiles_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_bookings_on_course_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "course_locations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_course_locations_on_school_id"
  end

  create_table "course_presets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_course_presets_on_school_id"
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "school_id"
    t.bigint "course_preset_id"
    t.bigint "course_location_id"
    t.float "price"
    t.date "start_date"
    t.date "end_date"
    t.integer "spaces"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_location_id"], name: "index_courses_on_course_location_id"
    t.index ["course_preset_id"], name: "index_courses_on_course_preset_id"
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "customer_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customer_profiles_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "phone_number"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "admin_profiles", "schools"
  add_foreign_key "admin_profiles", "users"
  add_foreign_key "bookings", "courses"
  add_foreign_key "bookings", "users"
  add_foreign_key "course_locations", "schools"
  add_foreign_key "course_presets", "schools"
  add_foreign_key "courses", "course_locations"
  add_foreign_key "courses", "course_presets"
  add_foreign_key "courses", "schools"
  add_foreign_key "customer_profiles", "users"
end
