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

ActiveRecord::Schema.define(version: 20140226053845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: true do |t|
    t.integer  "user_a_id",  null: false
    t.integer  "user_b_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invite_owners", force: true do |t|
    t.integer  "user_id"
    t.integer  "invite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invite_owners", ["invite_id"], name: "index_invite_owners_on_invite_id", using: :btree
  add_index "invite_owners", ["user_id"], name: "index_invite_owners_on_user_id", using: :btree

  create_table "invites", force: true do |t|
    t.time     "time"
    t.date     "date"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.integer  "ownerid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meet_owners", force: true do |t|
    t.integer  "user_id"
    t.integer  "meet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meet_owners", ["meet_id"], name: "index_meet_owners_on_meet_id", using: :btree
  add_index "meet_owners", ["user_id"], name: "index_meet_owners_on_user_id", using: :btree

  create_table "meets", force: true do |t|
    t.text     "comment"
    t.time     "time"
    t.date     "date"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.integer  "meet_id"
    t.integer  "invite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "phone"
    t.string   "name"
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invite_id"], name: "index_users_on_invite_id", using: :btree
  add_index "users", ["meet_id"], name: "index_users_on_meet_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
