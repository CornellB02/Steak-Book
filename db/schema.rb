# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_16_212549) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "reservs", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "restaurant_id", null: false
    t.string "first_name", null: false
    t.string "phone_number", null: false
    t.bigint "party_size"
    t.datetime "date", null: false
    t.datetime "time", null: false
    t.text "special_request"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rname"
    t.index ["restaurant_id"], name: "index_reservs_on_restaurant_id"
    t.index ["user_id"], name: "index_reservs_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.text "description"
    t.decimal "longitude", precision: 10, scale: 4, null: false
    t.decimal "latitude", precision: 10, scale: 4, null: false
    t.string "neighborhood", null: false
    t.string "cuisines", null: false
    t.string "dress_code", null: false
    t.string "parking_details", null: false
    t.string "executive_chef", null: false
    t.string "additional"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "opentime", null: false
    t.string "closetime", null: false
    t.string "price_range", null: false
    t.boolean "delivery", default: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "nickname"
    t.text "body", null: false
    t.integer "overall", null: false
    t.integer "food", null: false
    t.integer "service", null: false
    t.integer "ambience", null: false
    t.integer "value", null: false
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reviewer_firstname"
    t.string "reviewer_lastname"
    t.string "restaurant_name"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name
    t.string "email", null: false
    t.string "phone_number"
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
