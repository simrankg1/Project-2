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

ActiveRecord::Schema.define(version: 20140223191727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: true do |t|
    t.integer  "user_a_id",  null: false
    t.integer  "user_b_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invites", force: true do |t|
    t.time     "time"
    t.date     "date"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.integer  "ownerid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invites", ["user_id"], name: "index_invites_on_user_id", using: :btree

  create_table "meets", force: true do |t|
    t.text     "comment"
    t.time     "time"
    t.date     "date"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meets", ["user_id"], name: "index_meets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "name"
    t.string   "phone"
    t.text     "bio"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
