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

ActiveRecord::Schema.define(version: 20180821032147) do

  create_table "diagnoses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicaments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.string "phone"
    t.date "birthdate"
    t.integer "region_id"
    t.string "address"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_male", default: true
    t.index ["region_id"], name: "index_patients_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.boolean "is_active", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visit_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.date "visit_date"
    t.integer "patient_id"
    t.integer "visit_type_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "code"
    t.integer "turn_num"
    t.integer "diagnosis_id"
    t.integer "medicament_id"
    t.index ["diagnosis_id"], name: "index_visits_on_diagnosis_id"
    t.index ["medicament_id"], name: "index_visits_on_medicament_id"
    t.index ["patient_id"], name: "index_visits_on_patient_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
    t.index ["visit_type_id"], name: "index_visits_on_visit_type_id"
  end

end
