# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150713153624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attractions", force: :cascade do |t|
    t.string   "bumper_cars"
    t.string   "arcade"
    t.string   "himalaya"
    t.string   "carousel"
    t.string   "ballocity"
    t.string   "lazer"
    t.string   "runner"
    t.string   "soft_play"
    t.string   "inflatabales"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventpackages", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
  end

  create_table "events", force: :cascade do |t|
    t.string   "summary"
    t.string   "location"
    t.string   "description"
    t.datetime "start_date"
    t.string   "timezone"
    t.datetime "end_date"
    t.string   "attendees"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "paid"
    t.string   "package"
    t.boolean  "birthday"
    t.boolean  "super_birthday"
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_informations", force: :cascade do |t|
    t.float    "subtotal"
    t.float    "tax"
    t.float    "shipping"
    t.float    "total"
    t.integer  "order_status_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "order_informations", ["order_status_id"], name: "index_order_informations_on_order_status_id", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "eventpackages_id"
    t.integer  "order_information_id"
    t.float    "unit_price"
    t.integer  "quantity"
    t.float    "total_price"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "new_cart_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "card_number"
    t.integer  "events_id"
    t.integer  "event_id"
    t.string   "ip"
    t.boolean  "active"
  end

  add_index "orders", ["event_id"], name: "index_orders_on_event_id", using: :btree
  add_index "orders", ["events_id"], name: "index_orders_on_events_id", using: :btree

  create_table "ordertransactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.float    "price"
    t.float    "time"
    t.boolean  "private_party_room"
    t.boolean  "paper_goods"
    t.boolean  "pizza"
    t.string   "birthday_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "events_id"
  end

  add_index "packages", ["events_id"], name: "index_packages_on_events_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "order_informations", "order_statuses"
  add_foreign_key "orders", "events"
end
