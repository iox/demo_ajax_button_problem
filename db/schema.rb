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

ActiveRecord::Schema.define(version: 20140926003203) do

  create_table "agenda_items", force: true do |t|
    t.integer  "position"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "agenda_id"
  end

  add_index "agenda_items", ["agenda_id"], name: "index_agenda_items_on_agenda_id"
  add_index "agenda_items", ["position"], name: "index_agenda_items_on_position"

  create_table "agenda_subitems", force: true do |t|
    t.string   "position"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "agenda_item_id"
  end

  add_index "agenda_subitems", ["agenda_item_id"], name: "index_agenda_subitems_on_agenda_item_id"
  add_index "agenda_subitems", ["position"], name: "index_agenda_subitems_on_position"

  create_table "agendas", force: true do |t|
    t.string   "name"
    t.date     "meeting_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meeting_type", default: "Business"
  end

  create_table "users", force: true do |t|
    t.string   "crypted_password",          limit: 40
    t.string   "salt",                      limit: 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                default: "active"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], name: "index_users_on_state"

end
