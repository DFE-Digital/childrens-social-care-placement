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

ActiveRecord::Schema.define(version: 2020_12_10_132841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date_of_birth"
    t.integer "gender"
  end

  create_table "diary_entries", force: :cascade do |t|
    t.bigint "placement_id", null: false
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "event"
    t.index ["placement_id"], name: "index_diary_entries_on_placement_id"
  end

  create_table "foster_parents", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_foster_parents_on_user_id"
  end

  create_table "matchmakers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_matchmakers_on_user_id"
  end

  create_table "placement_needs", force: :cascade do |t|
    t.bigint "child_id"
    t.date "placement_date"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "county"
    t.string "postcode"
    t.integer "location_radius_miles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "criteria"
    t.index ["child_id"], name: "index_placement_needs_on_child_id"
  end

  create_table "placement_suitabilities", force: :cascade do |t|
    t.bigint "foster_parent_id"
    t.boolean "available", default: false, null: false
    t.boolean "long_term", default: false, null: false
    t.boolean "short_term", default: false, null: false
    t.boolean "emergency", default: false, null: false
    t.boolean "respite", default: false, null: false
    t.boolean "short_break", default: false, null: false
    t.boolean "remand", default: false, null: false
    t.boolean "specialist_theraputic", default: false, null: false
    t.boolean "parent_and_child", default: false, null: false
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "address_city"
    t.string "address_county"
    t.string "address_postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foster_parent_id"], name: "index_placement_suitabilities_on_foster_parent_id"
  end

  create_table "placements", force: :cascade do |t|
    t.bigint "foster_parent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "placement_need_id", null: false
    t.index ["foster_parent_id"], name: "index_placements_on_foster_parent_id"
    t.index ["placement_need_id"], name: "index_placements_on_placement_need_id"
  end

  create_table "shortlisted_foster_parents", force: :cascade do |t|
    t.bigint "shortlist_id", null: false
    t.bigint "foster_parent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foster_parent_id"], name: "index_shortlisted_foster_parents_on_foster_parent_id"
    t.index ["shortlist_id"], name: "index_shortlisted_foster_parents_on_shortlist_id"
  end

  create_table "shortlists", force: :cascade do |t|
    t.bigint "placement_need_id", null: false
    t.string "placement_types"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["placement_need_id"], name: "index_shortlists_on_placement_need_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
