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

ActiveRecord::Schema.define(version: 20150426015855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "source"
    t.string   "title"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["company_id"], name: "index_articles_on_company_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "ticker_symbol"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "sentiments", force: :cascade do |t|
    t.datetime "date_and_time"
    t.integer  "score"
    t.integer  "company_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "sentiments", ["company_id"], name: "index_sentiments_on_company_id", using: :btree

  create_table "stock_prices", force: :cascade do |t|
    t.datetime "date_and_time"
    t.decimal  "price"
    t.integer  "company_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "stock_prices", ["company_id"], name: "index_stock_prices_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "uid"
    t.string   "image_url"
    t.string   "provider"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "companies"
  add_foreign_key "sentiments", "companies"
  add_foreign_key "stock_prices", "companies"
end
