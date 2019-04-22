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

ActiveRecord::Schema.define(version: 2019_04_22_100620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "address_line1"
    t.string "address_line2"
    t.string "address_line3"
    t.string "postcode"
    t.text "delivery_instructions"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.text "description"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "customer_plans", id: :serial, force: :cascade do |t|
    t.integer "customer_id"
    t.integer "meal_plan_id"
    t.integer "days_per_week", default: 5
    t.boolean "subscription"
    t.integer "total_price_cents", default: 0, null: false
    t.boolean "promo_verified", default: false
    t.integer "promo_code_id"
    t.boolean "discount_applied", default: false
    t.boolean "half_package", default: false
    t.index ["customer_id"], name: "index_customer_plans_on_customer_id"
    t.index ["meal_plan_id"], name: "index_customer_plans_on_meal_plan_id"
    t.index ["promo_code_id"], name: "index_customer_plans_on_promo_code_id"
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.string "postcode"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "dob"
    t.integer "height"
    t.integer "weight"
    t.string "exercise"
    t.string "occupation"
    t.string "allergies"
    t.string "preferences"
    t.string "phone"
    t.string "stripe_customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.boolean "valid_postcode"
    t.string "slug"
    t.index ["slug"], name: "index_customers_on_slug", unique: true
  end

  create_table "extra_items", id: :serial, force: :cascade do |t|
    t.integer "customer_plan_id"
    t.integer "extra_id"
    t.integer "quantity_per_week"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weekly_price_cents", default: 0, null: false
    t.index ["customer_plan_id"], name: "index_extra_items_on_customer_plan_id"
    t.index ["extra_id"], name: "index_extra_items_on_extra_id"
  end

  create_table "extras", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "unit_price_cents", default: 0, null: false
    t.string "photo"
  end

  create_table "meal_plans", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "detailed_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "daily_price_cents", default: 0, null: false
    t.string "photo"
    t.float "half_daily_price_cents"
  end

  create_table "newsletter_subscriptions", id: :serial, force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.string "state"
    t.integer "customer_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_price_cents", default: 0, null: false
    t.index ["customer_plan_id"], name: "index_orders_on_customer_plan_id"
  end

  create_table "promo_codes", id: :serial, force: :cascade do |t|
    t.string "code"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
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
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "customer_plans", "customers"
  add_foreign_key "customer_plans", "meal_plans"
  add_foreign_key "customer_plans", "promo_codes"
  add_foreign_key "extra_items", "customer_plans"
  add_foreign_key "extra_items", "extras"
  add_foreign_key "orders", "customer_plans"
end
