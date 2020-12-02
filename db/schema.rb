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

ActiveRecord::Schema.define(version: 2020_12_02_223346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candies", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.boolean "in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "candy_shop_id"
    t.index ["candy_shop_id"], name: "index_candies_on_candy_shop_id"
  end

  create_table "candy_shops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distribution_centers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trucks_deployed"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.integer "shipments_received"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "distribution_centers_id"
    t.boolean "open"
    t.index ["distribution_centers_id"], name: "index_stores_on_distribution_centers_id"
  end

  add_foreign_key "candies", "candy_shops"
  add_foreign_key "stores", "distribution_centers", column: "distribution_centers_id"
end
