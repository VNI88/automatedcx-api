# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_23_235145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendants", id: :serial, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "evaluation", precision: 1, scale: 1, default: "0.0"
    t.integer "attendences_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attendences", id: :serial, force: :cascade do |t|
    t.bigint "attendant_id", null: false
    t.integer "interactions_count", default: 0
    t.jsonb "client_data"
    t.datetime "started_at", default: "2020-06-23 15:17:53"
    t.datetime "updated_at", default: "2020-06-23 15:17:53"
    t.datetime "finished_at"
  end

  create_table "routines", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "status", null: false
    t.datetime "started_at", default: "2020-06-23 15:17:53"
    t.datetime "updated_at", default: "2020-06-23 15:17:53"
    t.datetime "finished_at"
  end

  create_table "user_events", id: :serial, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "started_at", default: "2020-06-23 02:31:21"
    t.datetime "finished_at"
    t.string "name", null: false
    t.string "category", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "api_key", limit: 20, null: false
    t.string "role", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id"], name: "index_users_on_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attendants", "users"
  add_foreign_key "attendences", "attendants"
  add_foreign_key "user_events", "users"
end
