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

ActiveRecord::Schema.define(version: 20180221063411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at",             precision: 6, null: false
    t.datetime "updated_at",             precision: 6, null: false
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "number",                 limit: 100
    t.integer  "user_id"
    t.decimal  "total_price_items"
    t.decimal  "total_all_price"
    t.string   "receiver_name",          limit: 150
    t.string   "receiver_mobile_number", limit: 13
    t.string   "receiver_province",      limit: 100
    t.string   "receiver_city",          limit: 100
    t.text     "receiver_address"
    t.string   "receiver_postal_code",   limit: 10
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "order_status_id"
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",               limit: 100
    t.decimal  "price"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at",                     precision: 6, null: false
    t.datetime "updated_at",                     precision: 6, null: false
    t.string   "image_file_name",    limit: 100
    t.string   "image_content_type", limit: 100
    t.integer  "image_file_size"
    t.datetime "image_updated_at",               precision: 6
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "product_id"
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type",     limit: 30
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type",      limit: 100
    t.string   "price_currency", limit: 20
    t.decimal  "price_cents"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.string   "delivery_method", limit: 100
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "shopping_carts", ["order_id"], name: "index_shopping_carts_on_order_id", using: :btree
  add_index "shopping_carts", ["user_id"], name: "index_shopping_carts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 100,               default: "", null: false
    t.string   "encrypted_password",     limit: 100,               default: "", null: false
    t.string   "reset_password_token",   limit: 100
    t.datetime "reset_password_sent_at",             precision: 6
    t.datetime "remember_created_at",                precision: 6
    t.integer  "sign_in_count",                                    default: 0,  null: false
    t.datetime "current_sign_in_at",                 precision: 6
    t.datetime "last_sign_in_at",                    precision: 6
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                         precision: 6,              null: false
    t.datetime "updated_at",                         precision: 6,              null: false
    t.boolean  "admin"
    t.string   "name",                   limit: 150
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "shopping_carts", "orders"
  add_foreign_key "shopping_carts", "users"
end
