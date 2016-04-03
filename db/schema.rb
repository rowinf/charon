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

ActiveRecord::Schema.define(version: 20160403055516) do

  create_table "at_hop_accounts", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.string "run_on_day"
    t.text   "encrypted_password"
    t.text   "encrypted_password_iv"
  end

  add_index "at_hop_accounts", ["email"], name: "index_at_hop_accounts_on_email", unique: true

end
