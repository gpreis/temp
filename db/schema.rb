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

ActiveRecord::Schema.define(version: 2018_12_25_130859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.integer "number"
    t.string "district"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "country", default: "Brasil"
    t.string "complement"
    t.decimal "latitude", precision: 10, scale: 8
    t.decimal "longitude", precision: 10, scale: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_addresses_on_latitude_and_longitude"
  end

  create_table "addresses_customers", id: false, force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "customer_id", null: false
    t.index ["address_id", "customer_id"], name: "index_addresses_customers_on_address_id_and_customer_id"
    t.index ["customer_id", "address_id"], name: "index_addresses_customers_on_customer_id_and_address_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "phone", null: false
    t.string "name", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone"], name: "index_customers_on_phone"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.bigint "product_category_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  add_foreign_key "addresses_customers", "addresses"
  add_foreign_key "addresses_customers", "customers"
  add_foreign_key "products", "product_categories"
end
