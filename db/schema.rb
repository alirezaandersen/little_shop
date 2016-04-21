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

ActiveRecord::Schema.define(version: 20160420233810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.integer  "sex"
    t.integer  "size"
    t.integer  "age"
    t.integer  "activity_level"
    t.boolean  "house_trained"
    t.boolean  "spayed_neutered"
    t.boolean  "special_needs",   default: false
    t.boolean  "available"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "image_path"
    t.text     "description"
    t.integer  "species_id"
  end

  add_index "animals", ["species_id"], name: "index_animals_on_species_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["animal_id"], name: "index_favorites_on_animal_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "species", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

  create_table "visits", force: :cascade do |t|
    t.date     "date"
    t.time     "time"
    t.integer  "user_id"
    t.integer  "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "visits", ["animal_id"], name: "index_visits_on_animal_id", using: :btree
  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

  add_foreign_key "animals", "species"
  add_foreign_key "favorites", "animals"
  add_foreign_key "favorites", "users"
  add_foreign_key "visits", "animals"
  add_foreign_key "visits", "users"
end
