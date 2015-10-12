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

ActiveRecord::Schema.define(version: 20151010140718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baseproducts", force: true do |t|
    t.string   "name"
    t.date     "purchase_date"
    t.decimal  "unit_weight"
    t.decimal  "total_weight"
    t.decimal  "unit_count"
    t.decimal  "total_price"
    t.decimal  "unit_price"
    t.decimal  "price_per"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ingredient_id"
    t.integer  "vendor_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reference"
  end

  create_table "eventplanners", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventplates", force: true do |t|
    t.integer  "eventplanner_id"
    t.integer  "plate_id"
    t.integer  "covers"
    t.decimal  "over_ride_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventproducts", force: true do |t|
    t.integer  "eventplanner_id"
    t.integer  "product_id"
    t.integer  "covers"
    t.decimal  "over_ride_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "product_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "prodvolume"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit_item"
    t.decimal  "shrinkage"
  end

  create_table "items", force: true do |t|
    t.decimal  "price"
    t.integer  "weight"
    t.string   "size"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orderitems", force: true do |t|
    t.integer  "order_id"
    t.integer  "saleproduct_id"
    t.integer  "quantity"
    t.decimal  "item_price"
    t.decimal  "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.date     "collection_date"
    t.string   "contact_person"
    t.boolean  "marketing"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "date_selector"
    t.string   "status"
  end

  create_table "plates", force: true do |t|
    t.decimal  "price"
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productitems", force: true do |t|
    t.integer  "product_id"
    t.integer  "ingredient_id"
    t.decimal  "volume"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "price_selector"
    t.float    "unit_count"
  end

  create_table "productlinks", force: true do |t|
    t.integer  "product_id"
    t.integer  "productchild_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plate_id"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "meat"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.boolean  "shauna"
  end

  create_table "saleproducts", force: true do |t|
    t.string   "name"
    t.integer  "stock_quantity"
    t.integer  "remaining_quanity"
    t.decimal  "price",             precision: 16, scale: 2
    t.string   "weight"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "bill_addr1"
    t.string   "bill_addr2"
    t.string   "bill_addr3"
    t.string   "bill_addr4"
    t.string   "bill_postcode"
    t.string   "delivery_addr1"
    t.string   "delivery_addr2"
    t.string   "delivery_addr3"
    t.string   "delivery_addr4"
    t.string   "delivery_postcode"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "vendors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
