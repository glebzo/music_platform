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

ActiveRecord::Schema.define(version: 20160626103126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "albumable_id"
    t.string   "albumable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "albums", ["albumable_type", "albumable_id"], name: "index_albums_on_albumable_type_and_albumable_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.integer  "artistable_id"
    t.string   "artistable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "artists", ["artistable_type", "artistable_id"], name: "index_artists_on_artistable_type_and_artistable_id", using: :btree

  create_table "channels", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "soundtracks_count", default: 0
    t.integer  "albums_count",      default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "listeners", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "is_admin",               default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "listeners", ["email"], name: "index_listeners_on_email", unique: true, using: :btree
  add_index "listeners", ["reset_password_token"], name: "index_listeners_on_reset_password_token", unique: true, using: :btree

  create_table "soundtracks", force: :cascade do |t|
    t.string   "name"
    t.integer  "soundtrackable_id"
    t.string   "soundtrackable_type"
    t.integer  "channel_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "soundtrack_file_name"
    t.string   "soundtrack_content_type"
    t.integer  "soundtrack_file_size"
    t.datetime "soundtrack_updated_at"
  end

  add_index "soundtracks", ["channel_id"], name: "index_soundtracks_on_channel_id", using: :btree
  add_index "soundtracks", ["soundtrackable_type", "soundtrackable_id"], name: "index_soundtracks_on_soundtrackable_type_and_soundtrackable_id", using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "soundtrack_id"
    t.integer  "listener_id"
    t.integer  "score",         default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "votes", ["listener_id"], name: "index_votes_on_listener_id", using: :btree
  add_index "votes", ["soundtrack_id"], name: "index_votes_on_soundtrack_id", using: :btree

end
