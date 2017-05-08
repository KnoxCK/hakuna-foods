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

ActiveRecord::Schema.define(version: 20170508204100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "address_line3"
    t.string   "postcode"
    t.text     "delivery_instructions"
    t.integer  "customer_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id", using: :btree
  end

  create_table "customer_plans", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "meal_plan_id"
    t.integer "days_per_week",       default: 5
    t.boolean "subscription"
    t.integer "total_price_pennies", default: 0, null: false
    t.index ["customer_id"], name: "index_customer_plans_on_customer_id", using: :btree
    t.index ["meal_plan_id"], name: "index_customer_plans_on_meal_plan_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "postcode"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "dob"
    t.integer  "height"
    t.integer  "weight"
    t.string   "exercise"
    t.string   "occupation"
    t.string   "allergies"
    t.string   "preferences"
    t.string   "phone"
    t.string   "stripe_customer_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "email",              null: false
    t.boolean  "valid_postcode"
  end

  create_table "extra_items", force: :cascade do |t|
    t.integer  "customer_plan_id"
    t.integer  "extra_id"
    t.integer  "quantity_per_week"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "weekly_price_pennies", default: 0, null: false
    t.index ["customer_plan_id"], name: "index_extra_items_on_customer_plan_id", using: :btree
    t.index ["extra_id"], name: "index_extra_items_on_extra_id", using: :btree
  end

  create_table "extras", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.integer "unit_price_pennies", default: 0, null: false
  end

  create_table "meal_plans", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "detailed_description"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "daily_price_pennies",  default: 0, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "state"
    t.integer  "customer_plan_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "total_price_pennies", default: 0, null: false
    t.index ["customer_plan_id"], name: "index_orders_on_customer_plan_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "customer_plans", "customers"
  add_foreign_key "customer_plans", "meal_plans"
  add_foreign_key "extra_items", "customer_plans"
  add_foreign_key "extra_items", "extras"
  add_foreign_key "orders", "customer_plans"
end
