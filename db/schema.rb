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

ActiveRecord::Schema.define(version: 20170117181627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "barks", force: :cascade do |t|
    t.text     "title",      null: false
    t.text     "location",   null: false
    t.text     "content",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_barks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",      null: false
    t.string   "first_name",    null: false
    t.string   "last_name",     null: false
    t.string   "email",         null: false
    t.text     "password_hash", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
