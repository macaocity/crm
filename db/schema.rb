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

ActiveRecord::Schema.define(version: 20160710091431) do

  create_table "companies", force: :cascade do |t|
    t.string   "comp_name"
    t.string   "comp_tel"
    t.string   "comp_addr"
    t.string   "comp_country"
    t.string   "comp_city"
    t.string   "title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "contact_id"
  end

  add_index "companies", ["contact_id"], name: "index_companies_on_contact_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "chinese_first_name"
    t.string   "chinese_last_name"
    t.string   "nick_name"
    t.string   "occupation"
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "current_address"
    t.string   "remark"
  end

  create_table "email_addresses", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "contact_id"
  end

  add_index "email_addresses", ["contact_id"], name: "index_email_addresses_on_contact_id"

  create_table "notes", force: :cascade do |t|
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "contact_id"
  end

  add_index "notes", ["contact_id"], name: "index_notes_on_contact_id"

  create_table "phones", force: :cascade do |t|
    t.string   "category"
    t.string   "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "contact_id"
  end

  add_index "phones", ["contact_id"], name: "index_phones_on_contact_id"

end
