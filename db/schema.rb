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

ActiveRecord::Schema.define(version: 20160403085016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "at_hop_accounts", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.string "run_on_day"
    t.text   "encrypted_password"
    t.text   "encrypted_password_iv"
  end

  add_index "at_hop_accounts", ["email"], name: "index_at_hop_accounts_on_email", unique: true, using: :btree

  create_table "purchase_records", force: :cascade do |t|
    t.integer  "at_hop_account_id"
    t.string   "state"
    t.boolean  "simulated",         default: false
    t.text     "url"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end
